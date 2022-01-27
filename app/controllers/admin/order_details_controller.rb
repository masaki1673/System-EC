class Admin::OrderDetailsController < ApplicationController
 def update
     @order_details = OrderDetail.find(params[:id])
     @order_details.update!(order_detail_params)
     if @order_details.making_status == "constructing"
        @order_details.order.update(status: "constructing")
     elsif @order_details.making_status == "complete"
           @order_details.order.update(status: "ready_to_ship")
     end
     redirect_to admin_order_path(@order_details.order)
 end
 private
 def order_detail_params
 params.require(:order_detail).permit(:making_status)
 end
end
