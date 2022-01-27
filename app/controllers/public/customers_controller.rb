class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!
 def edit
  @customer = current_customer
 end
 def show
  @customer = current_customer
 end
 def unsubscribe
  @customer = current_customer
 end
 def withdraw
  @customer = current_customer
  @customer.update(is_active: true)
  reset_session
  redirect_to root_path
 end
 def update
  @customer = current_customer
    if @customer.update(public_params)
      redirect_to customers_my_page_path(@customer)
    else
      render :edit
    end
 end
 private
 def public_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_active)
 end
end
