FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    genre_prefecture_id { 3 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09044543453' }
    token     { 'tok_abcdefghijk00000000000000000' } 
  end
end
