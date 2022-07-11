require 'rails_helper'

RSpec.describe 'the trails show page' do
    # User Story 4, Child Show 

    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    it 'displays trail and attributes according to user-input id' do
        trail = Trail.create!(name: "Ute Trail: Alpine Visitor Center to Forest Canyon Pass", difficulty: "moderate", length: 3.5, elevation_gain: 364, dogs_allowed: true)

        visit "/trails/#{trail.id}"

        # save_and_open_page

        expect(page).to have_content(trail.id)
        expect(page).to have_content(trail.name)
        expect(page).to have_content(trail.difficulty)
        expect(page).to have_content(trail.length)
        expect(page).to have_content(trail.elevation_gain)
        expect(page).to have_content(trail.dogs_allowed)
    end
end