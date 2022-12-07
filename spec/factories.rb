FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }

    association :user, factory: :user
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
  end
end
