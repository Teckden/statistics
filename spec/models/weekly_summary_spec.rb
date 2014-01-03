require 'spec_helper'

describe WeeklySummary do

  describe "WeeklySummary record" do

    context 'when valid' do
      it 'should have a valid factory' do
        expect(FactoryGirl.build(:weekly_summary)).to be_valid
      end
    end

  end

end
