require 'rails_helper'

RSpec.describe 'the trails index page' do
    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    it 'displays the trails name and attributes' do
        trail = Trail.create!(name: "Emerald Lake Trail", difficulty: "moderate", length: 3.2, elevation_gain: 698, dogs_allowed: false)
        trail = Trail.create!(name: "Sky Pond via Glacier Gorge Trail", difficulty: "hard", length: 9.4, elevation_gain: 1758, dogs_allowed: false)
        trail = Trail.create!(name: "Ute Trail: Alpine Visitor Center to Forest Canyon Pass", difficulty: "moderate", length: 3.5, elevation_gain: 364, dogs_allowed: true)

        visit "/trails/"

        # save_and_open_page

        expect(page).to have_content(trail.name)
        expect(page).to have_content(trail.difficulty)
        expect(page).to have_content(trail.length)
        expect(page).to have_content(trail.elevation_gain)
        expect(page).to have_content(trail.dogs_allowed)
    end
end