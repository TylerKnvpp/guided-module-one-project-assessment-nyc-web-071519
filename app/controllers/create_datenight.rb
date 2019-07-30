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
    fetch_restaurants($LOCATION, random_offset)  
    binding.pry
end


def create_datenight
    puts "Please enter a neighborhood or location for your date."
    $LOCATION = gets.chomp 
    # puts "Please enter a day for your date."
    return_random_restaurant
end


