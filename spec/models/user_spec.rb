require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_frigana,first_frigana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できる' do
        @user.password = "12345a"
        @user.password_confirmation ="12345a"
        expect(@user).to be_valid
      end
      it 'last_nameが全角かな/カナ、漢字であれば登録できる' do
        @user.last_name = "石川"
        expect(@user).to be_valid
      end
      it 'first_nameが全角かな/カナ、漢字であれば登録できる' do
        @user.first_name = "五右衛門"
        expect(@user).to be_valid
      end
      it 'last_friganaが全角カタカナであれば登録できる' do
        @user.last_frigana = "イシカワ"
        expect(@user).to be_valid
      end
      it 'first_nameが全角カタカナであれば登録できる' do
        @user.first_frigana = "ゴエモン"
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
      end
      it 'passowrdが存在してもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角かな/カナ、漢字でない場合登録できない' do
        @user.last_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角かな/カナ、漢字ではない場合登録できない' do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'last_friganaが空だと登録できない' do
        @user.last_frigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last frigana can't be blank")
      end
      it 'last_friganaがカタカナでないと登録できない' do
        @user.last_frigana = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last frigana 全角カタカナのみで入力してください")
      end
      it 'first_friganaが空だと登録できない' do
        @user.first_frigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First frigana can't be blank")
      end
      it 'first_friganaがカタカナでないと登録できない' do
        @user.first_frigana = "bbbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("First frigana 全角カタカナのみで入力してください")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
