require 'rails_helper'

RSpec.feature 'Signups', type: :feature do

  context 'Food truck owner sigun up to create content' do
    Steps 'Signing up' do
      Given 'I am on the sign up page' do
        visit '/owners/sign_up'
      end
      Then 'I can see a sign up message' do
        expect(page).to have_content 'Sign Up'
      end
      When 'I fill in email and password fields' do
        fill_in 'Email', with: 'food01@gmail.com'
        fill_in 'Password (6 characters minimum)*', with: 'federico'
        fill_in 'Password Confirmation*', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Sign Up'
      end
      Then 'I will be redirected to the landing page' do
        visit '/'
      end
    end
  end

end
