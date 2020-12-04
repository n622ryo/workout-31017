FactoryBot.define do
  factory :user do
    email                 {"test@example"}
    password              {"111aaa"}
    password_confirmation {password}
    name                  {"ユーザー名"}
    target                {"具体的な目標"}
  end
end