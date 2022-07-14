require 'rails_helper'

RSpec.describe 'the parks index page' do
    before (:each) do
        @yellowstone = Park.create!(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "Early 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot. Mostly in Wyoming, the park spreads into parts of Montana and Idaho too. Yellowstone features dramatic canyons, alpine rivers, lush forests, hot springs and gushing geysers, including its most famous, Old Faithful.", fee: 22, open: false)
        @rocky_mountain = Park.create!(name: "Rocky Mountain National Park", state: "CO", city: "Estes Park", description: "Rocky Mountain National Park in northern Colorado spans the Continental Divide and encompasses protected mountains, forests and alpine tundra. It's known for the Trail Ridge Road and the Old Fall River Road, drives that pass aspen trees and rivers.", fee: 35, open: true)
    end

    it 'displays park names' do
        visit "/parks/"

        expect(page).to have_content(@yellowstone.name)
        expect(page).to have_content(@rocky_mountain.name)
    end

    it 'displays parks in order by recently created first with created at next to park' do
        visit '/parks'

        within '#park0' do
            expect(page).to have_content("Rocky Mountain National Park")
            expect(page).to_not have_content("Yellowstone National Park")
            expect(page).to have_content(@rocky_mountain.created_at)
        end

        within '#park1' do
            expect(page).to have_content("Yellowstone National Park")
            expect(page).to_not have_content("Rocky Mountain National Park")
            expect(page).to have_content(@yellowstone.created_at)
        end
    end

    it 'displays link at top of page to parent index' do
        visit '/parks'
        click_on 'Parks Index'
        expect(current_path).to eq('/parks/')
    end

    it 'displays link at top of page to parent index' do
        visit '/parks'
        click_on 'Trails Index'
        expect(current_path).to eq('/trails/')
    end
end