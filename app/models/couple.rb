class Couple < ActiveRecord::Base
    has_many :datenights
    has_many :restaurants, through: :datenights
end