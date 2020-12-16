class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_idetify
  before_action :move_to_index
  def index

    @buyer_shipping = BuyerShipping.new
  end

  def create
    @buyer_shipping = BuyerShipping.new(order_params)   
     if @buyer_shipping.valid?
      @buyer_shipping.save
      redirect_to root_path
     else
       render :index
     end
  end

  private

  def item_idetify
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end

  def order_params
    params.require(:buyer_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
