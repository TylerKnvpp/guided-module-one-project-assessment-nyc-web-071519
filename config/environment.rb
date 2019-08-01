require 'bundler'
require 'dotenv/load'
require 'colorize'
require 'colorized_string'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app/models'
require_all 'app/controllers'
