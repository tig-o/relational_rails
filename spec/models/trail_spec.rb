require 'rails_helper'

RSpec.describe Trail, type: :model  do
    it { should belong_to :park }
end
