require 'rails_helper'

RSpec.describe 'the parks show page' do
    it 'displays the park name' do
        park = Park.create(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "come on out and see old faithful!", fee: 22, open: false)
        visit "/parks/#{park.id}" #like going to localhost:3000/parks/1 and show me a park
    end
end