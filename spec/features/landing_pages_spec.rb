require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
   Steps 'Being welcomed' do
     Given 'I am on the landing page' do
       visit '/'
     end
     Then 'I can see a welcome message' do
       expect(page).to have_content('Food Trucker')
       expect(page).to have_content('Welcome to Food Trucker')
     end
     Then 'I can view a placeholder for a map' do
       expect(page).to have_content('Your map')
     end
   end
 end
end
