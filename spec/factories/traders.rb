# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :trader do
    pamm_name "john"
    pamm_url "URL"
    pamm_broker "happy"
    pamm_num 12345

    factory :trader_with_weekly_summary do
      after(:create) do |trader|
        create_list(:weekly_summary, 2, trader: trader)
      end
    end
  end

end
