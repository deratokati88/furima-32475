require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'データが全て揃っていれば登録できる' do
      expect(@item).to be_valid
    end

    it '画像がなければ保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it '名前がなければ保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    it '説明がなければ保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end

    it 'カテゴリーが選択されていなければ保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end

    it 'ステータスが選択されていなければ保存できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Status must be other than 1"
    end

    it '送料が選択されていなければ保存できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge must be other than 1"
    end

    it '地域が選択されていなければ保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
    end

    it '発送までの時間が選択されていなければ保存できない' do
      @item.shipping_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping time must be other than 1"
    end

    it '価格の入力が必要なこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 299"
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than 10000000"
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
  end
end
