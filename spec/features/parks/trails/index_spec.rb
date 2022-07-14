require 'rails_helper'

RSpec.describe 'Parks trails index' do
    before (:each) do
        @yellowstone = Park.create!(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "Early 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot. Mostly in Wyoming, the park spreads into parts of Montana and Idaho too. Yellowstone features dramatic canyons, alpine rivers, lush forests, hot springs and gushing geysers, including its most famous, Old Faithful.", fee: 22, open: false)
        
        @prismatic = @yellowstone.trails.create!(name: "Grand Prismatic Hot Spring", difficulty: "easy", length: 1.5, elevation_gain: 200, dogs_allowed: false)
        @geyser_faithful = @yellowstone.trails.create!(name: "Upper Geyser Basin and Old Faithful Observation Point Loop", difficulty: "moderate", length: 4.9, elevation_gain: 357, dogs_allowed: false)
    end

    it 'displays all of the trails with attributes for a user-input park' do
        visit "/parks/#{@yellowstone.id}/trails"
        
        expect(page).to have_content(@prismatic.name)
        expect(page).to have_content(@prismatic.difficulty)
        expect(page).to have_content(@prismatic.length)
        expect(page).to have_content(@prismatic.elevation_gain)
        expect(page).to have_content(@prismatic.dogs_allowed)

        expect(page).to have_content(@geyser_faithful.name)
        expect(page).to have_content(@geyser_faithful.difficulty)
        expect(page).to have_content(@geyser_faithful.length)
        expect(page).to have_content(@geyser_faithful.elevation_gain)
        expect(page).to have_content(@geyser_faithful.dogs_allowed)
    end

    it 'displays link at top of page to parent index' do
        visit "/parks/#{@yellowstone.id}/trails"
        click_on 'Parks Index'
        expect(current_path).to eq('/parks/')
    end

    it 'displays link at top of page to parent index' do
        visit "/parks/#{@yellowstone.id}/trails"
        click_on 'Trails Index'
        expect(current_path).to eq('/trails/')
    end
end