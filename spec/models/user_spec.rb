require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemail、passwordとpassword_confirmation、名前、カナ、誕生日を入力すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'name入力して登録できる' do
        @user.name = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'dfa111'
        @user.password_confirmation = 'dfa111'
        expect(@user).to be_valid
      end
      it 'first_name入力して登録できる' do
        @user.first_name = 'う'
        expect(@user).to be_valid
      end
      it 'last_name入力して登録できる' do
        @user.last_name = 'え'
        expect(@user).to be_valid
      end
      it 'first_name_kana入力して登録できる' do
        @user.first_name_kana = 'オ'
        expect(@user).to be_valid
      end
      it 'last_name_kana入力して登録できる' do
        @user.last_name_kana = 'ケ'
        expect(@user).to be_valid
      end
      it 'birthday入力して登録できる' do
        @user.birthday = '1999-11-11'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに＠が入っていないと登録できない' do
        @user.email = 'ew23i'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは不正な値です")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationが違えば登録できない' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aa0'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが6文字以上で数字だけであれば登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが6文字以上英字だけであれば登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが6文字以上全角英字が入っているとで登録できない' do
        @user.password = 'aaaaaＡ'
        @user.password_confirmation = 'aaaaaＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが6文字以上全角数字が入っていると登録できない' do
        @user.password = 'aaaaa２'
        @user.password_confirmation = 'aaaaa２'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は不正な値です")
      end
      it 'first_nameが半角カタカナだと登録できない' do
        @user.first_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it 'first_nameが半角英字だと登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it 'first_nameが半角数字だと登録できない' do
        @user.first_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end
      it 'last_nameが半角カタカナだと登録できない' do
        @user.last_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'last_nameが半角英字だと登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'last_nameが半角数字だと登録できない' do
        @user.last_name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください", "苗字（カナ）は不正な値です")
      end
      it 'first_name_kanaがひらがなだと登録できない' do
        @user.first_name_kana = 'え'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it 'first_name_kanaが漢字だと登録できない' do
        @user.first_name_kana = '上'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it 'first_name_kanaが全角英字だと登録できない' do
        @user.first_name_kana = 'Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it 'first_name_kanaが半角英字だと登録できない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it 'first_name_kanaが半角数字だと登録できない' do
        @user.first_name_kana = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it 'first_name_kanaが全角数字だと登録できない' do
        @user.first_name_kana = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）は不正な値です")
      end
      it 'last_name_kanaがひらがなだと登録できない' do
        @user.last_name_kana = 'え'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'last_name_kanaが漢字だと登録できない' do
        @user.last_name_kana = '上'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'last_name_kanaが全角英字だと登録できない' do
        @user.last_name_kana = 'Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'last_name_kanaが半角英字だと登録できない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'first_name_kanaが半角数字だと登録できない' do
        @user.last_name_kana = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'last_name_kanaが全角数字だと登録できない' do
        @user.last_name_kana = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'birthdayの年が空だと登録できない' do
        @user.birthday = '-----02-22'
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'birthdayの月が空だと登録できない' do
        @user.birthday = '2020----22'
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'birthdayの日が空だと登録できない' do
        @user.birthday = '2020-11---'
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
