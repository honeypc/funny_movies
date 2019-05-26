FactoryBot.define do
  factory :movie do
    name     {Faker::Name.name }
    description {Faker::Lorem.word }
    url      {Faker::Internet.url}
    user
  end

  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    confirmed_at { Date.today }
  end
end
