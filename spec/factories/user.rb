FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "john.doe#{n}@example.com" }
    sequence(:password) { |n| "!P@$SW0rd#{n * 2}" }
    sequence(:password_confirmation) { "#{password}" }
  end
end