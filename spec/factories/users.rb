FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    first_name_zenkaku    {'加藤'}
    first_name_kana       {'カトウ'}
    last_name_zenkaku     {'泰平'}
    last_name_kana        {'タイヘイ'}
    birthday              {'1987/09/15'}
  end
end