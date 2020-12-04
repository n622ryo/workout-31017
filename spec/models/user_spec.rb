require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかない時' do
      it "email、password、password_confirmation、name、targetが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@含まれていれば登録できる" do
        @user.email = "test@example"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "a11111"
        @user.password_confirmation = "a11111"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字であれば登録できる" do
        @user.password = "a11111"
        @user.password_confirmation = "a11111"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が無いと登録できない" do
        @user.email = "aaa.com"  
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do 
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)  
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a1111"
        @user.password_confirmation = "a1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英語のみであれば登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみであれば登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角英数字であれば登録できない" do
        @user.password = "ａ１１１１１"
        @user.password_confirmation = "ａ１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "ユーザー名が空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "目標が空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end