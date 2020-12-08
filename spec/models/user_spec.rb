require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'データが全て揃っていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは＠を含む必要がある' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは６文字以上必要なこと' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角英数字の混合であること' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は6文字以上かつ英数字をそれぞれ含めてください'
    end
    it 'passwordは半角英数字の混合であること' do
      @user.password = 'abcdef'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は6文字以上かつ英数字をそれぞれ含めてください'
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが一致している必要があること' do
      @user.password = 'test11'
      @user.password_confirmation = 'test22'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字が必要であること' do
      @user.l_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("L name can't be blank")
    end
    it '名前が必要であること' do
      @user.f_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("F name can't be blank")
    end
    it '名字は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.l_name = 'やまだ'
      expect(@user).to be_valid
    end
    it '名字は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.l_name = 'ヤマダ'
      expect(@user).to be_valid
    end
    it '名字は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.l_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name 全角で漢字、ひらがな、かたかなのみで入力して下さい')
    end
    it '名字は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.l_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('L name 全角で漢字、ひらがな、かたかなのみで入力して下さい')
    end
    it '名前は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.f_name = 'たろう'
      expect(@user).to be_valid
    end
    it '名前は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.f_name = 'タロウ'
      expect(@user).to be_valid
    end
    it '名前は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.f_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name 全角で漢字、ひらがな、かたかなのみで入力して下さい')
    end
    it '名前は全角漢字・カタカナ・ひらがなの必要があること' do
      @user.f_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('F name 全角で漢字、ひらがな、かたかなのみで入力して下さい')
    end
    it '名字のフリガナが必要であること' do
      @user.l_kananame = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("L kananame can't be blank")
    end
    it '名前のフリガナが必要であること' do
      @user.f_kananame = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("F kananame can't be blank")
    end
    it '名字のフリガナは全角カタカナの必要があること' do
      @user.l_kananame = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('L kananame に全角カタカナを使用してください')
    end
    it '名字のフリガナは全角カタカナの必要があること' do
      @user.l_kananame = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('L kananame に全角カタカナを使用してください')
    end
    it '名字のフリガナは全角カタカナの必要があること' do
      @user.l_kananame = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('L kananame に全角カタカナを使用してください')
    end
    it '名字のフリガナは全角カタカナの必要があること' do
      @user.l_kananame = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('L kananame に全角カタカナを使用してください')
    end
    it '名前のフリガナは全角カタカナの必要があること' do
      @user.f_kananame = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('F kananame に全角カタカナを使用してください')
    end
    it '名前のフリガナは全角カタカナの必要があること' do
      @user.f_kananame = '太朗'
      @user.valid?
      expect(@user.errors.full_messages).to include('F kananame に全角カタカナを使用してください')
    end
    it '名前のフリガナは全角カタカナの必要があること' do
      @user.f_kananame = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('F kananame に全角カタカナを使用してください')
    end
    it '名前のフリガナは全角カタカナの必要があること' do
      @user.f_kananame = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('F kananame に全角カタカナを使用してください')
    end
    it '生年月日の入力が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
