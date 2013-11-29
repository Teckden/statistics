require 'spec_helper'

describe User do
  describe 'when we create user record' do
    it 'should have a valid factory' do
      FactoryGirl.create(:user).should be_valid
    end

    it 'should not be valid if password is too short or blank' do
      FactoryGirl.build(:user, password: '').should_not be_valid
      FactoryGirl.build(:user, password: 'test').should_not be_valid
    end

    it 'should not be valid if email is blank or does not feet the regexp' do
      FactoryGirl.build(:user, email: '').should_not be_valid
      FactoryGirl.build(:user, email: 'test.ua').should_not be_valid
    end
  end
end
