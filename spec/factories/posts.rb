FactoryBot.define do
  factory :post do
    price { 1000 }
    description { 'writing' }
    hourly_wage { 100 }
    elapsed_time { 3600 }
    start_date { 1 }
    end_date { 3601 }
    status { 0 }
  end

  factory :post1 do
    price { 1000 }
    description { 'writing' }
    hourly_wage { 100 }
    elapsed_time { 3600 }
    start_date { 1 }
    end_date { 3601 }
    status { 1 }
  end

  factory :post2 do
    price { 1000 }
    description { 'writing' }
    hourly_wage { 100 }
    elapsed_time { 3600 }
    start_date { 1 }
    end_date { 3601 }
    status { 2 }
  end

  factory :post3 do
    price { 1000 }
    description { 'writing' }
    hourly_wage { 100 }
    elapsed_time { 3600 }
    start_date { 1 }
    end_date { 3601 }
    status { 3 }
  end
end
