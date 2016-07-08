require 'rails_helper'

RSpec.feature 'Ownerrestrictions', type: :feature do

  context 'Food truck owner signing in' do
    Steps 'Signing in' do
      Given 'I am on the log in page' do
        visit '/owners/sign_in'
      end
      Then 'I can see a log in message' do
        expect(page).to have_content'Log in'
      end
      When 'I fill in email and password fields' do
        fill_in 'Email', with: 'food@gmail.com'
        fill_in 'Password', with: 'federico'
      end
      And 'I submit the information' do
         click_button 'Log in'
      end
      Then 'I will be redirect to the landing page' do
        visit '/'
      end
    end
  end
    Steps 'Trying to go to another owners profile' do
      Given 'Im ont the landing page' do
        visit '/owners/3'
      end
      Then 'I change the url to another owners profile' do
        expect(page).to have_content 'Food Truck'
    end
    end
  end
``
