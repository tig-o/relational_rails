require 'rails_helper'

RSpec.describe 'the parks show page' do
    before (:each) do
        @yellowstone = Park.create!(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "Early 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot. Mostly in Wyoming, the park spreads into parts of Montana and Idaho too. Yellowstone features dramatic canyons, alpine rivers, lush forests, hot springs and gushing geysers, including its most famous, Old Faithful.", fee: 22, open: false)
        @rocky_mountain = Park.create!(name: "Rocky Mountain National Park", state: "CO", city: "Estes Park", description: "Rocky Mountain National Park in northern Colorado spans the Continental Divide and encompasses protected mountains, forests and alpine tundra. It's known for the Trail Ridge Road and the Old Fall River Road, drives that pass aspen trees and rivers.", fee: 35, open: true)
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

    
end