class Event < ActiveRecord::Base
    has_many :datenights
    has_many :couples, through: :datenights
    has_many :restaurants, through: :datenights
end