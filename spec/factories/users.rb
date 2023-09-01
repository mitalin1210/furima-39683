FactoryBot.define do
  factory :user do
    name                  { 'test' }
    email                 { 'tes@t' }
    password              { '11111q' }
    password_confirmation { password }
    first_name            { 'あ' }
    last_name             { 'あ' }
    first_name_kana       { 'ア' }
    last_name_kana        { 'ア' }
    birthday              { '1999-11-11' }
  end
end