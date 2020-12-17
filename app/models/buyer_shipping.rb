class BuyerShipping
  include ActiveModel::Model
  attr_accessor :item_id, :buyer_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone, format: {with: /\A[0-9]{9,11}+\z/, message: "is invalid. Input half-width characters."}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }
  
  def save
    buyer = Buyer.create(item_id: item_id,user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, buyer_id: buyer.id)
  end
end