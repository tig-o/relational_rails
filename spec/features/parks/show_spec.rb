require 'rails_helper'

RSpec.describe 'the parks show page' do
    before (:each) do
        @yellowstone = Park.create!(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "Early 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot. Mostly in Wyoming, the park spreads into parts of Montana and Idaho too. Yellowstone features dramatic canyons, alpine rivers, lush forests, hot springs and gushing geysers, including its most famous, Old Faithful.", fee: 22, open: false)
        @rocky_mountain = Park.create!(name: "Rocky Mountain National Park", state: "CO", city: "Estes Park", description: "Rocky Mountain National Park in northern Colorado spans the Continental Divide and encompasses protected mountains, forests and alpine tundra. It's known for the Trail Ridge Road and the Old Fall River Road, drives that pass aspen trees and rivers.", fee: 35, open: true)
        
        @prismatic = @yellowstone.trails.create!(name: "Grand Prismatic Hot Spring", difficulty: "easy", length: 1.5, elevation_gain: 200, dogs_allowed: false)
        @geyser_faithful = @yellowstone.trails.create!(name: "Upper Geyser Basin and Old Faithful Observation Point Loop", difficulty: "moderate", length: 4.9, elevation_gain: 357, dogs_allowed: false)
        @mystic_fairy = @yellowstone.trails.create!(name: "Mystic Falls, Fairy Creek and Little Firehole Loop", difficulty: "moderate", length: 3.5, elevation_gain: 606, dogs_allowed: false)

        @emerald = @rocky_mountain.trails.create!(name: "Emerald Lake Trail", difficulty: "moderate", length: 3.2, elevation_gain: 698, dogs_allowed: false)
        @skypond = @rocky_mountain.trails.create!(name: "Sky Pond via Glacier Gorge Trail", difficulty: "hard", length: 9.4, elevation_gain: 1758, dogs_allowed: false)
        @ute = @rocky_mountain.trails.create!(name: "Ute Trail: Alpine Visitor Center to Forest Canyon Pass", difficulty: "moderate", length: 3.5, elevation_gain: 364, dogs_allowed: true)
    end

    it 'displays park with the user-input id and the park attributes' do
        visit "/parks/#{@yellowstone.id}"
                
        expect(page).to have_content(@yellowstone.id)
        expect(page).to have_content(@yellowstone.name)
        expect(page).to have_content(@yellowstone.state)
        expect(page).to have_content(@yellowstone.city)
        expect(page).to have_content(@yellowstone.description)
        expect(page).to have_content(@yellowstone.fee)
        expect(page).to have_content(@yellowstone.open)
    end

    it 'displays trails open per park' do
        visit "/parks/#{@rocky_mountain.id}"
        
        expect(page).to have_content("Trails Total: 3")
    end
end