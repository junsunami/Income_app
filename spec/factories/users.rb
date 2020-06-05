FactoryBot.define do

  factory :user do
    email { 'user@test.com' }
    password {'asdfasdf'}
    password_confirmation {'asdfasdf'}
    confirmed_at { Time.now}
  end

  factory :admin, class: "AdminUser" do
    email { 'admin@test.com' }
    password {'asdfasdf'}
    password_confirmation {'asdfasdf'}
    confirmed_at { Time.now}
  end
end
