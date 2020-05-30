FactoryBot.define do
  factory :post do
    price { 1000 }
    description { 'writing' }
    start_date { 1 }
    end_date { 3601 }
  end
end
