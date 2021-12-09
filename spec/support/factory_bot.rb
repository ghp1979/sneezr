require 'factory_bot'

  FactoryBot.define do
    factory :zip_code do
      zip_code { "02144" }
    end
  end

  FactoryBot.define do
    factory :user do
      zip_code_id { 1 }
      sequence(:email) {|n| "user#{n}@example.com" }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end
    
  FactoryBot.define do
    factory :symptom_report do
      user_id { 1 }
      sneezing { 0 }
      congestion { 3 }
      runny_nose { 2 }
      itchy_nose { 1 }
      created_at { Date.new(2021, 12, 9)}
    end
  end