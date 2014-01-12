require 'spec_helper'

describe TradersController do

  before(:each) do
    @trader ||= FactoryGirl.create(:trader)
  end

  describe "GET 'index'" do
    it "returns http success and renders traders" do
      get 'index'
      expect(response).to be_success
      expect(assigns(:traders)).to eq([@trader])
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', { id: @trader.id }
      expect(response).to be_success
      expect(assigns(:trader)).to eq(@trader)
    end
  end

  context "when creating record" do
    describe "GET 'new'" do
      it "returns http success" do
        get 'new'
        expect(response).to be_success
        expect(assigns(:trader)).to be
      end
    end

    describe "create trader" do
      before(:each) do
        new_trader = FactoryGirl.build(:trader)
        @params = {
            pamm_name: new_trader.pamm_name,
            pamm_url: new_trader.pamm_url,
            pamm_broker: new_trader.pamm_broker,
            pamm_num: new_trader.pamm_num
        }
      end
      it "should create record and redirect to the trader" do
        post 'create', trader: @params

        expect(Trader.last).to eq(assigns(:trader))
        expect(response).to redirect_to(trader_path(assigns(:trader)))
        expect(flash[:notice]).to eq('Трейдер успешно добавлен в базу данных')
      end

      it "should not create record without params and should render new" do
        Trader.any_instance.stub(:save).and_return(false)
        post 'create', trader: @params
        expect(response).to render_template(:new)
        expect(response.request.request_parameters[:trader].to_param).to eq(@params.to_param)
      end
    end
  end

  context "when editing record" do
    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit', { id: @trader.id }
        expect(response).to be_success
        expect(assigns(:trader)).to eq(@trader)
      end
    end

    describe "update trader" do
      it "should update trader and redirect to this trader" do
        patch 'update', { id: @trader.id, trader: { pamm_name: 'James' } }
        @trader.reload
        expect(response).to redirect_to(trader_path(@trader))
        expect(flash[:notice]).to eq('Данные трейдера успешно обновлены')
        expect(@trader.pamm_name).to eq('James')
      end

      it "should not update trader and render edit if data is invalid" do
        Trader.any_instance.stub(:update).and_return(false)
        patch 'update', { id: @trader.id, trader: { pamm_name: 'James' } }

        expect(response).to render_template(:edit)
        expect(response.request.request_parameters[:trader][:pamm_name]).to eq('James')
      end
    end
  end

  context "when destroying record" do
    it "should destroy record" do
      delete 'destroy', { id: @trader.id }
      expect(response).to redirect_to(traders_path)
      expect(Trader.find_by_id(@trader.id)).to be(nil)
      expect(flash[:notice]).to eq('Трейдер успешно удален')
    end

    it "should not destroy record and render show adction" do
      Trader.any_instance.stub(:destroy).and_return(false)
      delete 'destroy', { id: @trader.id }
      expect(response).to render_template(:show)
    end
  end
end
