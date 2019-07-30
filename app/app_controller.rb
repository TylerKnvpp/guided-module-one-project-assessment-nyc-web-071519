require_relative '../config/environment'
require_relative './controllers/account_setup' #maybe change?
# Dir[".controllers/*.rb"].each {|file| require_relative file }
require_relative './controllers/main_menu'
require 'pry'

#GLOBAL VARIABLE TO SAVE COUPLE_ID
$LOGGED_IN_ID = nil

def logged_in_couple
    Couple.find($LOGGED_IN_ID)
end

start_prompt

binding.pry
puts "hello world"