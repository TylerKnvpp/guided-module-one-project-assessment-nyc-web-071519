class Datenight < ActiveRecord::Base
    belongs_to :couple
    belongs_to :restaurant
    belongs_to :event
end