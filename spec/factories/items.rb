FactoryBot.define do
  factory :item do
    association :todo
    sequence(:name) { |n| "TEST_NAME_#{n}"}
    done { false }
  end
end