require 'rails_helper'

RSpec.feature "Contributors", type: :feature do
  context 'logging in' do
    Steps 'logging in as a contributor' do
      Given 'I am  on the login page' do
        visit '/'
        click_link 'Log In'
      end
    end
  end
end
