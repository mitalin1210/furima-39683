class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string      :product_name,            null: false
      t.text        :description,             null: false
      t.integer     :genre_id,                null: false  
      t.integer     :genre_status_id,         null: false
      t.integer     :genre_shipping_cost_id,  null: false
      t.integer     :genre_shipping_day_id,   null: false
      t.integer     :genre_prefecture_id ,    null: false
      t.integer     :selling_price ,          null: false
      t.references :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
