class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!
 def confirm
  @cart_items = current_customer.cart_items
  @order = Order.new(order_params)
   @order.customer_id = current_customer.id
    @order.status = 0
    @order.total_payment = get_total_price
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
    elsif params[:order][:address_option] == "2"
     @order.postal_code = params[:order][:postal_code]
     @order.address = params[:order][:address]
     @order.name = params[:order][:name]
    end
 end
 def index
  @orders = Order.all
 end
 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
 end
 def update
 end
 def new
  @order = Order.new
 end
 def complate
 end
 def create
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.shipping_cost = 800
     @order.total_payment = get_total_price
     @order.status = 0
     if @order.save
         flash[:notice]= 'successfully create order!'
         @cart_items = current_customer.cart_items
         @cart_items.each do |cart_item|
             @order_details = OrderDetail.new
             @order_details.order_id = @order.id
             @order_details.item_id = cart_item.item_id
             @order_details.price = cart_item.item.price
             @order_details.amount = cart_item.amount
             @order_details.making_status = 1
             @order_details.save
         end
     end
     @cart_items.destroy_all
     redirect_to orders_complete_path
 end
 def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
 end
 def get_total_price
  @cart_items = current_customer.cart_items
  @total = 800
  @cart_items.each do |cart_item|
   @total += (cart_item.item.price * 1.1).floor * cart_item.amount
  end
  return @total
 end
end