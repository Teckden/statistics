require 'spec_helper'

describe Trader do
  it "has a valid factory" do
    FactoryGirl.create(:trader).should be_valid
  end
end
