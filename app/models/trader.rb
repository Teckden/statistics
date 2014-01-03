class Trader < ActiveRecord::Base
  has_many :weekly_summaries, dependent: :destroy
end
