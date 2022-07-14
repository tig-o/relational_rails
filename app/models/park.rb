class Park < ApplicationRecord
    has_many :trails
    
    validates_presence_of :name
    validates_presence_of :state
    validates_presence_of :city
    validates_presence_of :description
    validates_presence_of :fee
    validates_inclusion_of :open, :in => [true,false]

    def self.order_by_timestamp_created
        order(created_at: :desc)
    end
end