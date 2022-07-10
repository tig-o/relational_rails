require 'rails_helper'

RSpec.describe 'the parks show page' do
    # User Story 2, Parent Show 
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table

    it 'displays park with the user-input id and the park attributes' do
        park = Park.create!(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "come on out and see old faithful!", fee: 22, open: false)
        visit "/parks/#{park.id}" #like going to localhost:3000/parks/1 and show me a park
        
        # save_and_open_page
        
        expect(page).to have_content(park.id)
        expect(page).to have_content(park.name)
        expect(page).to have_content(park.state)
        expect(page).to have_content(park.city)
        expect(page).to have_content(park.description)
        expect(page).to have_content(park.fee)
        expect(page).to have_content(park.open)
    end
end