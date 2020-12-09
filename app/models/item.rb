class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user 
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_time
  has_one_attached :image

  validates :name, :description, :price, presence: true
  validates :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_time_id, numericality: { other_than: 1 } 
end
