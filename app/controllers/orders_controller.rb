class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buyer_shipping = BuyerShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_shipping = BuyerShipping.new(order_params)   
     if @buyer_shipping.valid?
      @buyer_shipping.save
      redirect_to root_path
     else
       render :index
     end
  end

  private

  def order_params
    params.require(:buyer_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
