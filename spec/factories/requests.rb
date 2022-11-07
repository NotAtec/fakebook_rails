FactoryBot.define do
  factory :request do
    user { nil }
    friend_id { 1 }
    confirmed { false }
  end
end
