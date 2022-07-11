require 'rails_helper'

RSpec.describe 'the trails index page' do
    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    it 'displays the trails name and attributes' do
        trails = Trail.create!(name: "Emerald Lake Trail", difficulty: "moderate", length: 3.2, elevation_gain: 698, dogs_allowed: false)
        trails = Trail.create!(name: "Sky Pond via Glacier Gorge Trail", difficulty: "hard", length: 9.4, elevation_gain: 1758, dogs_allowed: false)
        trails = Trail.create!(name: "Ute Trail: Alpine Visitor Center to Forest Canyon Pass", difficulty: "moderate", length: 3.5, elevation_gain: 364, dogs_allowed: true)

        visit "/trails"
        
        save_and_open_page

        expect(page).to have_content(trails.name)
        expect(page).to have_content(trails.difficulty)
        expect(page).to have_content(trails.length)
        expect(page).to have_content(trails.elevation_gain)
        expect(page).to have_content(trails.dogs_allowed)
    end
end