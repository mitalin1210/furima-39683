require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe'商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: user.id,item_id: item.id)
      sleep(1)
    end
  
      context '購入が保存できる場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
        it '建物の入力がなくても購入できる' do
          @order_address.building_name = ''
          expect(@order_address).to be_valid
        end
      end
  
      context '内容に問題がある場合' do
        it "tokenが空では登録できないこと" do
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_address.postal_code = 1_234_567
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid")
        end
        it "postal_codeが空では登録できないこと" do
          @order_address.postal_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'genre_prefecture_idが--では保存できないこと' do
          @order_address.genre_prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Genre prefecture を選択してください')
        end
        it 'cityが空では保存できないこと' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberが空では保存できないこと' do
          @order_address.house_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空では保存できないこと' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが11桁以下では保存できないこと' do
          @order_address.phone_number = 222
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが12桁以上では保存できないこと' do
          @order_address.phone_number = 222_222_222_222
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが数字以外が入ると保存できないこと' do
          @order_address.phone_number = '2222222222e'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end
        it "電話番号が半角数字では保存できない" do
          @order_address.phone_number = '０９０１２３４１２３４'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'user_idが空では登録できないこと' do
          @order_address.user_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では登録できないこと' do
          @order_address.item_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
