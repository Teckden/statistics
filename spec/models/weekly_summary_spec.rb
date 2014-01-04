require 'spec_helper'

describe WeeklySummary do

  it { should belong_to(:trader) }

  describe "WeeklySummary record" do

    context 'when valid' do
      it { expect(FactoryGirl.build(:weekly_summary)).to be_valid }
    end

  end
end
