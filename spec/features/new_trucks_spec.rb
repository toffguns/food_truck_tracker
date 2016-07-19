require 'rails_helper'

RSpec.feature "NewTrucks", type: :feature do
  context 'creating new trucks' do
    Steps 'creating a new truck' do
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
    end
  end
end
