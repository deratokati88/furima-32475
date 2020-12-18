require 'rails_helper'

RSpec.describe BuyerShipping, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user1 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user1.id)
      @user2 = FactoryBot.create(:user)
      @buyer_shipping = FactoryBot.build(:buyer_shipping, user_id: @user2.id, item_id: @item.id)
      sleep(1)
    end

    it 'データが全て揃っていれば登録できる' do
      expect(@buyer_shipping).to be_valid
    end

    it '建物名がなくても他のデータが全て揃っていれば登録できる' do
      @buyer_shipping.building = ''
      expect(@buyer_shipping).to be_valid
    end

    it 'ユーザーIDがなければ登録できない' do
      @buyer_shipping.user_id = nil
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include "User can't be blank"
    end


    it 'アイテムIDがなければ登録できない' do
      @buyer_shipping.item_id = nil
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include "Item can't be blank"
    end

    it '郵便番号がなければ登録できない' do
      @buyer_shipping.postal_code = ''
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include "Postal code can't be blank"
    end

    it '郵便番号には文字は保存できない' do
      @buyer_shipping.postal_code = 'aaa-aaaa'
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end

    it '郵便番号にはハイフンがなければ保存できない' do
      @buyer_shipping.postal_code = '1234567'
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
    end

    it '都道府県コードを入力しなければ保存できない' do
      @buyer_shipping.prefecture_id = 1
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include 'Prefecture must be other than 1'
    end

    it '市区町村がなければ保存できない' do
      @buyer_shipping.city = ''
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include "City can't be blank"
    end

    it '番地がなければ保存できない' do
      @buyer_shipping.address = ''
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include "Address can't be blank"
    end

    it '電話番号がなければ保存できない' do
      @buyer_shipping.phone = ''
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include "Phone can't be blank"
    end

    it '電話番号が11桁以上では保存できない' do
      @buyer_shipping.phone = '123456789123'
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include 'Phone is invalid. Input half-width characters.'
    end

    it '電話番号はハイフンがあると保存できない' do
      @buyer_shipping.phone = '090-123-456'
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include 'Phone is invalid. Input half-width characters.'
    end

    it 'tokenが空では登録できないこと' do
      @buyer_shipping.token = nil
      @buyer_shipping.valid?
      expect(@buyer_shipping.errors.full_messages).to include("Token can't be blank")
    end
  end
end
