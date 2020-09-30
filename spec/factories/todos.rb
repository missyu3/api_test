FactoryBot.define do
  factory :todo do
    sequence(:title) { |n| "TEST_TITLE_#{n}"}
  end
end