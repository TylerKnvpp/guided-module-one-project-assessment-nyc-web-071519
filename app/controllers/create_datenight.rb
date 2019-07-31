require "json"
require "http"
require "optparse"

# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  

# DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "New York City, NY"
SEARCH_LIMIT = 1
#RATINGS_LIMIT = 3

$LOCATION = ''
$DAY_OF = ''

def fetch_restaurants(location, offset)
      url = "#{API_HOST}#{SEARCH_PATH}"
        params = {
            term: DEFAULT_TERM,
            location: location,
            offset: offset,
            limit: SEARCH_LIMIT,
            sort_by: 'rating'
        }
  response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: params)
  response.parse
end


def return_random_restaurant
    total = fetch_restaurants($LOCATION, 0)['total']
    if total > 1000 
        total = 1000
    end
    random_offset = rand(0..(total - 1))
    rest_hash = fetch_restaurants($LOCATION, random_offset)
    if check_if_in_table(rest_hash) 
        Restaurant.find_by(yelp_id: rest_hash['businesses'][0]['id'])
    else 
        Restaurant.new(yelp_id: rest_hash['businesses'][0]['id'], name: rest_hash['businesses'][0]['name'], neighborhood: $LOCATION, rating: rest_hash['businesses'][0]['rating'], price: rest_hash['businesses'][0]['price'], phone_num: rest_hash['businesses'][0]['phone'], url: rest_hash['businesses'][0]['url'])  
    end
    #binding.pry
end

def check_if_in_table(rest_hash)
    Restaurant.exists?(yelp_id: rest_hash['businesses'][0]['id']) ?  true : false
    #binding.pry
end

def create_date_night_menu_helper
    possible_rest = return_random_restaurant
    puts "\n\nHow would you like to go to #{possible_rest.name}?"
    puts %Q(
        1. Save this date.

        2. See restaurant details.

        3. Get a new recommendation.

        4. Exit
        )
    user_input_save_or_get = gets.chomp
    case user_input_save_or_get.downcase
    when '1','save','save this date','save date'
        possible_rest.save unless Restaurant.exists?(possible_rest.id)
        save_new_date(user_id: $LOGGED_IN_ID, restaurant_id: possible_rest.id, planned_date: $DAY_OF)
        puts "\n\nEnjoy your datenight! Shoot for the stars.\n\n"
        launch_main_menu
    when '2','details','see details','see restaurant details'
        show_restaurant_details(possible_rest)
    when '3','new','try again', 'get a new recommendation','new rec','get new rec','get new recommendation'
        create_date_night_menu_helper
    when '4','exit','bye', 'gtfo', 'c ya'
        launch_main_menu
    else
        puts "Please enter a valid response."
        create_date_night_menu_helper
    end
end

def launch_create_datenight_menu
    puts "\n\nPlease enter a neighborhood or location for your date."
    $LOCATION = gets.chomp 
    puts "\nWhen's your hot date? (dd-mm-yyyy)"
    $DAY_OF = gets.chomp
    create_date_night_menu_helper
end

def save_new_date(hash)
    Datenight.create(hash)
end

def show_restaurant_details(restaurant)
    rest_deets =  %Q(
    Name: #{restaurant.name}
    Neighborhood: #{restaurant.neighborhood}
    Rating: #{restaurant.rating}
    Price: #{restaurant.price}
    Phone: #{restaurant.phone_num}
    URL: #{restaurant.url}
    )
    header =  ':: Restaurant Details ::'
    show_table(rest_deets, header)
    puts %Q(
        1. Save this date.

        2. Get a new recommendation

        3. Exit
        )
    user_input_save_or_new = gets.chomp
    case user_input_save_or_new.downcase
    when '1','save','save this date'
        restaurant.save unless Restaurant.exists?(restaurant.id)
        save_new_date(user_id: $LOGGED_IN_ID, restaurant_id: restaurant.id, planned_date: $DAY_OF)
        puts "\n\nEnjoy your datenight! Shoot for the stars.\n\n"
        launch_main_menu
    when '2','new','get new','get a new recommendation','new rec','get new rec','get new recommendation'
        create_date_night_menu_helper
    when '3','exit','bye', 'gtfo', 'c ya'
        launch_main_menu
    else
        puts "\nPlease enter a valid response.\n"
        show_restaurant_details
    end
    #binding.pry
end

