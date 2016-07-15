require 'rails_helper'

RSpec.feature "TimeAndPlace", type: :feature do
  context 'new TimeAndPlace' do
    Steps 'creating a new TimeAndPlace for a food truck' do
      Given 'I register as an owner' do
        visit '/'
        click_link 'Register'
        fill_in 'Email', with: 'food02@gmail.com'
        fill_in 'Password', with: 'federico'
        fill_in 'Password confirmation', with: 'federico'
        click_button 'Sign up'
      end
      Then 'I create a new truck' do
        click_link 'Truck List'
        click_link 'New Truck'
        attach_file("Image", Rails.root + "app/assets/images/facebook2.png")
        fill_in 'Name', with: 'Al\'s possum truck'
        fill_in 'Cuisine', with: 'backwood bbq'
        fill_in 'Menu', with: 'possum squirrel racoon'
        click_button 'Create Truck'
      end
      And 'I go to my profile page' do
        click_link 'Profile'
      end
      Then 'I can click on the new time and place link' do
        click_link 'New Time And Place'
      end
      And 'I create a new time and place for my truck' do
        fill_in 'Street address', with: '3803 Ray St.'
        fill_in 'City', with: "San Diego"
        fill_in 'Zip code', with: "92104"
        fill_in 'State', with: "CA"
        click_button 'Create Time and place'
      end
      Then 'I will be directed to my trucks profile page' do
        expect(page).to have_content 'Al\'s possum truck'
      end
      Then 'I can go to the edit time and place page' do
        truck_id = (Truck.where(name: "Al\'s possum truck"))[0].id
        id = (TimeAndPlace.where(city: "San Diego"))[0].id
        visit ('/time_and_places/'+ id.to_s + '/edit?truck_id=' + truck_id.to_s)
      end
      Then 'I can edit the time and place' do
        fill_in 'Street address', with: '3803 Ray St.'
        fill_in 'City', with: "San Diego"
        fill_in 'Zip code', with: "92105"
        fill_in 'State', with: "CA"
        click_button 'Update Time and place'
      end
      Then 'I can see the changes made' do
        expect(page).to have_content '92105'
      end
    end
  end
end
