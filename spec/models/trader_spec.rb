require 'spec_helper'

describe Trader do
  context 'when valid' do
    it "has a valid factory" do
      expect(FactoryGirl.build(:trader)).to be_valid
    end
  end
end
