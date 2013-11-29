require 'spec_helper'

describe User do
  describe 'user record' do
    context 'when valid' do
      it 'should have a valid factory' do
        expect(FactoryGirl.build(:user)).to be_valid
      end
    end
    context 'when not valid' do
      it 'should not be valid if password is too short or blank' do
        expect(FactoryGirl.build(:user, password: '')).to_not be_valid
        expect(FactoryGirl.build(:user, password: 'test')).to_not be_valid
      end

      it 'should not be valid if email is blank or does not feet the regexp' do
        expect(FactoryGirl.build(:user, email: '')).to_not be_valid
        expect(FactoryGirl.build(:user, email: 'test.ua')).to_not be_valid
      end
    end
  end
end
