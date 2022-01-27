class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!,except: [:index]
 def index
  @items = Item.all
 end
 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
 end
 
 private
 def public_params
  params.require(:items).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_active)
 end
end 