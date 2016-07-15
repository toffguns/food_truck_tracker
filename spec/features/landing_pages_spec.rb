# require 'rails_helper'
#
# RSpec.feature "LandingPages", type: :feature, js: true do
#
#   context 'Going to website' do
#    Steps 'Being welcomed' do
#      Given 'I am on the landing page' do
#        visit '/'
#      end
#      Then 'I can see a welcome message' do
#        expect(page).to have_content('Food Trucker')
#        expect(page).to have_content('Welcome to Food Trucker')
#      end
#      Then 'I can view a placeholder for a map' do
#        expect(page).to have_content('Your map')
#      end
#      And 'I can view a map with trucks on it' do
#        page.find("#map")[:class].include?("gm-style")
#      end
#    end
#  end
# end
