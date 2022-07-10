require 'rails_helper'

RSpec.describe 'the trails index page' do
    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    it 'displays the trails name and attributes' do
        visit "/trails"
    end
end