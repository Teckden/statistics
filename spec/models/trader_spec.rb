require 'spec_helper'

describe Trader do
  context 'when valid' do
    it { expect(FactoryGirl.build(:trader)).to be_valid }
  end

  context 'when has many weekly summaries' do
    it 'should have association with weekly_summaries' do
      t = Trader.reflect_on_association(:weekly_summaries)
      expect(t.macro).to be(:has_many)
    end
  end

end
