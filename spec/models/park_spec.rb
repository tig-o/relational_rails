require 'rails_helper'

RSpec.describe Park, type: :model do
    describe 'relationships' do
        it { should have_many :trails }
    end

    describe 'validations' do # when i create a park and it has a name, it should have a name
        it { should validate_presence_of :name }
        it { should validate_presence_of :state }
        it { should validate_presence_of :city }
        it { should validate_presence_of :description }
        it { should validate_presence_of :fee }
        it { should allow_value(true).for :open}
        it { should allow_value(false).for :open}
        it { should_not allow_value(nil).for :open}
    end

    describe 'order_by_timestamp_created' do
        it 'displays parks in order by recently created first' do
            yellowstone = Park.create!(name: "Yellowstone National Park", state: "WY", city: "Multiple", description: "Early 3,500-sq.-mile wilderness recreation area atop a volcanic hot spot. Mostly in Wyoming, the park spreads into parts of Montana and Idaho too. Yellowstone features dramatic canyons, alpine rivers, lush forests, hot springs and gushing geysers, including its most famous, Old Faithful.", fee: 22, open: false)
            rocky_mountain = Park.create!(name: "Rocky Mountain National Park", state: "CO", city: "Estes Park", description: "Rocky Mountain National Park in northern Colorado spans the Continental Divide and encompasses protected mountains, forests and alpine tundra. It's known for the Trail Ridge Road and the Old Fall River Road, drives that pass aspen trees and rivers.", fee: 35, open: true)
            expect(Park.order(created_at: :desc)).to eq([rocky_mountain, yellowstone])
        end
    end
end