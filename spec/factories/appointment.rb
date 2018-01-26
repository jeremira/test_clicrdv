FactoryBot.define do
  factory :appointment do
    start_at DateTime.new(2020,1,1,10,10,10)
    end_at   DateTime.new(2020,1,1,11,11,11)
    customer_name 'Jean-Test FactoryBot'
    calendar
    intervention
  end
end
