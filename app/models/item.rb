class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_charge, :prefecture, :shipping_time

  validates :name, :description, :price, presence: true
  validates :category_id, :status_id, :shipping_charge_id, :prefecture_id, :shipping_time_id numericality: { other_than: 1 } 
end
