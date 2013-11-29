require 'spec_helper'

describe '_header without user' do
  before(:each) do
    render partial: 'layouts/header.html.haml'
  end

  context 'when no user' do
    it 'should have button log in' do
      expect(rendered).to have_link('Log In')
    end
  end
end

describe 'when user' do
  login_user

  before(:each) do
    render partial: 'layouts/header.html.haml'
  end

  context 'when user' do
    it 'should have log out when user is logged in' do
      expect(rendered).to have_link('Log Out')
    end
  end
end
