# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weekly_summary do
    start_week        "01/01/2014"
    end_week          "07/01/2014"
    total_profit      10.12
    investor_profit   5.06
  end
end
