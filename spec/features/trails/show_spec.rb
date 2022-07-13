require 'rails_helper'

RSpec.describe 'the trails show page' do
    # User Story 4, Child Show 

    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    it 'displays trail and attributes according to user-input id' do
        rocky_mountain = Park.create!(name: "Rocky Mountain National Park", state: "CO", city: "Estes Park", description: "Rocky Mountain National Park in northern Colorado spans the Continental Divide and encompasses protected mountains, forests and alpine tundra. It's known for the Trail Ridge Road and the Old Fall River Road, drives that pass aspen trees and rivers.", fee: 35, open: true)
        emerald = rocky_mountain.trails.create!(name: "Emerald Lake Trail", difficulty: "moderate", length: 3.2, elevation_gain: 698, dogs_allowed: false)
        skypond = rocky_mountain.trails.create!(name: "Sky Pond via Glacier Gorge Trail", difficulty: "hard", length: 9.4, elevation_gain: 1758, dogs_allowed: false)
        ute = rocky_mountain.trails.create!(name: "Ute Trail: Alpine Visitor Center to Forest Canyon Pass", difficulty: "moderate", length: 3.5, elevation_gain: 364, dogs_allowed: true)

        visit "/trails/#{emerald.id}"

        # save_and_open_page

        expect(page).to have_content(emerald.name)
        expect(page).to have_content(emerald.difficulty)
        expect(page).to have_content(emerald.length)
        expect(page).to have_content(emerald.elevation_gain)
        expect(page).to have_content(emerald.dogs_allowed)
    end
end