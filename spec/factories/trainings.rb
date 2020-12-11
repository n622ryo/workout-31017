FactoryBot.define do
  factory :training do
    title               {"腕を太くしたい！"}
    trainingtime_id     { 2 }
    part_id             { 4 }
    event               {"アームカール"}
    association :user
  end
end
