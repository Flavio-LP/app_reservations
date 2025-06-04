FactoryBot.define do
    factory :user do
      email { "test@example.com" }
      password { "password" }
      admin { false }
    end
  end