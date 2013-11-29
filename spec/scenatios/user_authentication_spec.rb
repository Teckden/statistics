require 'spec_helper'

describe 'User authentication', type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  context 'when valid user' do
    it 'should log in successfully' do
      visit '/'
      expect(page).to have_link('Log In')
      click_link 'Log In'
      within("#new_user") do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Sign in'
      expect(page).to have_content("Signed in successfully.")
    end
  end
end
