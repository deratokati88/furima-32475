FactoryBot.define do
  factory :user do
    f_kananame            {"ヤマダ"}
    l_kananame            {"タロウ"}
    f_name                {"山田"}
    l_name                {"太朗"}
    birthday              {Faker::Date.birthday(min_age: 0, max_age: 100)}
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"test12"}
    password_confirmation {password}
  end
end
