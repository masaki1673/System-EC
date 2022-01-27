class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!
 def index
  @order = Order.new
  @cart_items = CartItem.all
  @total = 0
 end
 def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    end
 end
 def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  if @cart_item.save!
      redirect_to cart_items_path(@cart_item)
  end
 end
 def destroy
 @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
 end
 def destroy_all
  @cart_item = CartItem.all
    @cart_item.destroy_all
    redirect_to cart_items_path
 end
 def with_tax_price
    (price * 1.1).floor
 end
 def subtotal
    item.with_tax_price * amount
 end
 private
def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
end
end
