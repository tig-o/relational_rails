class Trail < ApplicationRecord
    belongs_to :park
    
    validates_presence_of :name
    validates_presence_of :difficulty
    validates_presence_of :length
    validates_presence_of :elevation_gain
    validates_inclusion_of :dogs_allowed, :in => [true,false]
end