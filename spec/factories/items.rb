FactoryBot.define do
  factory :item do
    product_name                  { 'test' }
    description                   { 'test' }
    genre_id                      { 3 }
    genre_status_id               { 3 }
    genre_shipping_cost_id        { 2 }
    genre_shipping_day_id         { 2 }
    genre_prefecture_id           { 3 }
    selling_price                 { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.jpg'), filename: 'test_image.jpg')
    end
    association :user
  end
end