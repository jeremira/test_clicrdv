FactoryBot.define do
  factory :opening do
    start_at DateTime.new(2020,1,1,01,01,01)
    end_at   DateTime.new(2020,1,2,02,02,02)
    calendar
  end
end
