FactoryBot.define do
  factory :calendar do
    sequence(:name) { |n| "Factory_calendar_#{n}"}
    intervals 10
  end
end
