class Restaurant < ActiveRecord::Base
    has_many :datenights
    has_many :couples, through: :datenights
    has_many :Events, through: :datenights
end