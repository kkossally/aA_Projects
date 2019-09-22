FactoryBot.define do
  factory :user do
    username { Faker::Twitter.screen_name }
    password { 'figvaper' }
  end
end