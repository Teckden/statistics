require 'spec_helper'

describe Trader do
  context 'when valid' do
    it "has a valid factory" do
      FactoryGirl.build(:trader).should be_valid
    end
  end
end
