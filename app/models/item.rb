class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :genre_shipping_cost
  belongs_to_active_hash :genre_shipping_day
  belongs_to_active_hash :genre_status
  belongs_to_active_hash :genre
  belongs_to_active_hash :genre_prefecture
  belongs_to :user, optional: true
  has_one :order
  

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :selling_price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 299, less_than_or_equal_to: 999_999_999 }
    validates :genre_shipping_cost_id
    validates :genre_shipping_day_id
    validates :genre_status_id
    validates :genre_id
    validates :genre_prefecture_id
  end
  with_options numericality: { other_than: 1, message: "を選択してください"} do
    validates :genre_shipping_cost_id
    validates :genre_shipping_day_id
    validates :genre_status_id
    validates :genre_id
    validates :genre_prefecture_id
  end
end
