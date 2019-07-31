require_relative '../config/environment'
require_relative './controllers/account_setup' #maybe change?
# Dir[".controllers/*.rb"].each {|file| require_relative file }
#require_all 'controllers'
require_relative './controllers/main_menu'
require_relative './controllers/create_datenight'
require_relative './controllers/past_datenights'
require 'pry'

#GLOBAL VARIABLE TO SAVE COUPLE_ID
$LOGGED_IN_ID = nil

def logged_in_couple
    Couple.find($LOGGED_IN_ID)
end

def show_table (string, header)
    divider = '--------------------------------------------------------------'
    puts divider
    puts "\n#{header}"
    puts string
    puts "\n#{divider}"
end

#launch_login_menu

#binding.pry