require 'rails_helper'

RSpec.feature "Searches", type: :feature do
  context 'searching the database' do
    Steps 'for performing a search' do
      Given 'that I register as an owner' do
        visit '/'
        click_link 'Sign Up'
        fill_in 'Email', with: "jordan@jordan.com"
        fill_in 'Password (6 characters minimum)*', with: 'fishtacos'
        fill_in 'Password Confirmation*', with: 'fishtacos'
        click_button 'Sign Up'
      end
      Then 'I can click on the list of food trucks link' do
        click_link 'Profile'
      end
      And 'I can click on the New truck link' do
        click_link 'Create a New Truck'
      end
      And 'I can fill in the fields and click on the new truck button' do
        attach_file("Image", Rails.root + "app/assets/images/facebooklogin.png")
        fill_in 'Name', with: 'shrimp blimp'
        fill_in 'Cuisine', with: 'cajun'
        fill_in 'Menu', with: 'Gumbo'
        click_button 'Save Truck'
      end
      And 'I will see a confirmation message' do
        expect(page).to have_content "Truck was successfully created"
      end
      Then 'when I go to the shrimp blimp edit page' do
        id = (Truck.where(name: "shrimp blimp"))[0].id
        visit ('/time_and_places/new?truck_id=' + id.to_s)
      end
      And 'I fill in the timeandplace fields' do
        select '2017', from: 'time_and_place_start_time_1i'
        select '2018', from: 'time_and_place_end_time_1i'
        fill_in 'Street address', with: '2466 Hartford Street'
        fill_in 'City', with: 'San Diego'
        fill_in 'Zip code', with: '92111'
        fill_in 'State', with: 'CA'
        click_button 'Save Location'
        visit '/'
      end
      Then 'I can click on the list of food trucks link' do
        click_link 'Profile'
      end
      And 'I can click on the New truck link' do
        click_link 'Create a New Truck'
      end
      And 'I can fill in the fields and click on the new truck button' do
        attach_file("Image", Rails.root + "app/assets/images/facebooklogin.png")
        fill_in 'Name', with: 'Rodney Riguez'
        fill_in 'Cuisine', with: 'fish'
        fill_in 'Menu', with: 'Rumbo'
        click_button 'Save Truck'
      end
      And 'I will see a confirmation message' do
        expect(page).to have_content "Truck was successfully created"
      end
      Then 'when I go to the Rodney Riguez edit page' do
        id = (Truck.where(name: "Rodney Riguez"))[0].id
        visit ('/time_and_places/new?truck_id=' + id.to_s)
      end
      And 'I fill in the timeandplace fields' do
        select '2019', from: 'time_and_place_end_time_1i'
        fill_in 'Street address', with: '3803 Ray St.'
        fill_in 'City', with: "San Diego"
        fill_in 'Zip code', with: "92104"
        fill_in 'State', with: "CA"
        click_button 'Save Location'
      end
      Given 'that I am on the landing page' do
        visit '/'
      end
      Then 'I can select \"Search trucks\"' do
        find('#search-select').find(:xpath, 'option[2]').select_option
      end
      Then 'I can fill in the search field' do
        fill_in 'search-field', with: 'fish'
      end
      And 'I can click on the Search button' do
        click_button 'search_button'
      end
      Then 'I can select \"Search by address\"' do
        find('#search-select').find(:xpath, 'option[1]').select_option
      end
      Then 'I can search by address' do
        fill_in 'search-field', with: '3803 Ray St.'
      end
      And 'I can click on the Address Search button' do
        click_button 'search_button'
      end
    end
  end
end
