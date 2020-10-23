FactoryBot.define do
  factory :user do
    nickname              { 'nick' }
    email                 { 'kkk@gmail.com' }
    password              { '000000' }
    password_confirmation { password }
    first_name            { '鈴木' }
    last_name             { '鈴木' }
    first_name_kana       { 'スズキ' }
    last_name_kana        { 'スズキ' }
    birthday              { 1986 / 5 / 8 }
  end
end
