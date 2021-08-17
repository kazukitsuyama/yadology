FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { 'a11111' }
    password_confirmation { password }
  end
end
