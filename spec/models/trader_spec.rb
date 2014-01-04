require 'spec_helper'

describe Trader do

  it { should have_many(:weekly_summaries) }

  context 'when valid' do
    it { expect(FactoryGirl.build(:trader)).to be_valid }
  end

end
