FactoryBot.define do
  factory :post_tag do
    association :post, factory: :post
    association :tag, factory: :tag
  end

  factory :tag do
    name { Faker::Lorem.word }
    post_count { 1 }
  end

  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    association :user, factory: :user

    after(:build) do |post|
      post.tags << FactoryBot.create(:tag)
    end
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    username { Faker::Internet.username }
  end
end
