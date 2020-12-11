class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_time
  has_one_attached :image

  validates :name, :description, :price, :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を入力してください' }, numericality: { only_integer: true,
                                                                                              greater_than: 299, less_than: 10_000_000 }
  validates :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_time_id, numericality: { other_than: 1 }
end
