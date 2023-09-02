require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context '出品が保存できる場合' do
      it '全て記入して保存される' do
        expect(@item).to be_valid
      end
    end

    context '出品内容が保存できない場合' do
      it 'カテゴリーが空だと保存できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーを選択してください")
      end
      it '商品の状態が空だと保存できない' do
        @item.genre_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力してください", "商品状態を選択してください")
      end
      it '配送料の負担が空だと保存できない' do
        @item.genre_shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください", "配送料の負担を選択してください")
      end
      it '発送元の地域が空だと保存できない' do
        @item.genre_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください", "発送元の地域を選択してください")
      end
      it '発送までの日数が空だと保存できない' do
        @item.genre_shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数を選択してください")
      end
      it '価格が空だと保存できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は不正な値です", "販売価格は数値で入力してください")
      end
    end

    context '出品内容が保存できない場合' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空だと保存できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空だと保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが--だと保存できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態が--だと保存できない' do
        @item.genre_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品状態を選択してください')
      end
      it '配送料の負担が--だと保存できない' do
        @item.genre_shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域が--だと保存できない' do
        @item.genre_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数が--だと保存できない' do
        @item.genre_shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格が300円以下だと保存できない' do
        @item.selling_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は299以上の値にしてください')
      end
      it '価格が999999999円以上だと保存できない' do
        @item.selling_price = 9_999_999_991
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は999999999以下の値にしてください')
      end
      it '価格が全角数字だと保存できない' do
        @item.selling_price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
  end
end