require 'rails_helper'

RSpec.describe Trail, type: :model do
    describe 'relationships' do
        it { should belong_to :park }
    end

    describe 'validations' do # when i create a park and it has a name, it should have a name
        it { should validate_presence_of :name }
        it { should validate_presence_of :difficulty }
        it { should validate_presence_of :length }
        it { should validate_presence_of :elevation_gain }
        it { should allow_value(true).for :dogs_allowed}
        it { should allow_value(false).for :dogs_allowed}
        it { should_not allow_value(nil).for :dogs_allowed}
    end
end