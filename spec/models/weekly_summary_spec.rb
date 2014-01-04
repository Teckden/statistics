require 'spec_helper'

describe WeeklySummary do

  describe "WeeklySummary record" do

    context 'when valid' do
      it { expect(FactoryGirl.build(:weekly_summary)).to be_valid }
    end

    context 'when belongs_to trader' do
      it 'should belongs_to trader' do
        ws = WeeklySummary.reflect_on_association(:trader)
        expect(ws.macro).to be(:belongs_to)
      end
    end

  end
end
