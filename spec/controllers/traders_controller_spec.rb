require 'spec_helper'

describe TradersController do

  before(:each) do
    @trader = FactoryGirl.create(:trader)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      p @trader
      get 'show', { id: @trader.id }
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', { id: @trader.id }
      expect(response).to be_success
    end
  end

end
