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
end