FactoryBot.define do
  factory :tweet do
    yado_title         { Faker::Name.initials }
    yado_name          { Faker::Name.initials }
    text               { Faker::Lorem.sentence }
    date               { '2020/10/01' }
    price              { 300 }
    area_id            { 2 }
    association :user

    after(:build) do |tweet|
      tweet.images.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
