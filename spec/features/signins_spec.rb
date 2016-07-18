require 'rails_helper'

RSpec.feature 'Signins', type: :feature do

  context 'Food truck owner signing in' do
    Steps 'Signing in' do
      Given 'I am on the log in page' do
        visit '/owners/sign_in'
      end
      Then 'I can see a log in message' do
        expect(page).to have_content'Log In'
      end
      When 'I fill in email and password fields' do
        fill_in 'Email', with: 'food@gmail.com'
        fill_in 'Password', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Log In'
      end
      Then 'I will be redirect to the trucks listing page' do
        visit '/'
      end
    end
  end

end
