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

$LOCATION = ''
$DAY_OF = ''

def fetch_restaurants(location, offset)
      url = "#{API_HOST}#{SEARCH_PATH}"
        params = {
            term: DEFAULT_TERM,
            location: location,
            offset: offset,
            limit: SEARCH_LIMIT
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
    Restaurant.new(yelp_id: rest_hash['businesses'][0]['id'], name: rest_hash['businesses'][0]['name'], neighborhood: $LOCATION, rating: rest_hash['businesses'][0]['rating'], price: rest_hash['businesses'][0]['price'], phone_num: rest_hash['businesses'][0]['phone'], url: rest_hash['businesses'][0]['url'])  
    #binding.pry
end

def create_date_night_menu_helper
    possible_rest = return_random_restaurant
    puts "How would you like to go to #{possible_rest.name}?"
    puts "Enter 1 to save this date or 2 to see restaurant details."
    user_input_save_or_get = gets.chomp
    case user_input_save_or_get.downcase
    when '1'
        possible_rest.save
        save_new_date(user_id: $LOGGED_IN_ID, restaurant_id: possible_rest.id, planned_date: $DAY_OF)
        puts 'Enjoy your datenight! Shoot for the stars.'
    when '2'
        show_restaurant_details(possible_rest)
    when 'exit'
        launch_main_menu
    else
        puts "Please enter a valid response."
        create_date_night_menu_helper
    end
end

def launch_create_datenight_menu
    puts "Please enter a neighborhood or location for your date."
    $LOCATION = gets.chomp 
    puts "When's your hot date?"
    $DAY_OF = gets.chomp
    create_date_night_menu_helper
end

def save_new_date(hash)
    Datenight.create(hash)
end

def show_restaurant_details(restaurant)
    puts %Q(
        Name: #{restaurant.name}
        Neighborhood: #{restaurant.neighborhood}
        Rating: #{restaurant.rating}
        Price: #{restaurant.price}
        Phone: #{restaurant.phone_num}
        URL: #{restaurant.url}
    )
    puts 'Enter 1 to save this date or 2 to get a new recommendation'
    user_input_save_or_new = gets.chomp
    case user_input_save_or_new.downcase
    when '1'
        restaurant.save
        save_new_date(user_id: $LOGGED_IN_ID, restaurant_id: restaurant.id, planned_date: $DAY_OF)
        puts 'Enjoy your datenight! Shoot for the stars.'
    when '2'
        create_date_night_menu_helper
    when 'exit'
        launch_main_menu
    else
        puts "Please enter a valid response."
        show_restaurant_details
    end
    #binding.pry
end

