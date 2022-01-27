class Admin::CustomersController < ApplicationController
 def index
    @customers = Customer.all
    
 end
 def show
    @customer = Customer.find(params[:id])
 end
 def edit
    @customer = Customer.find(params[:id])
 end
 private
  def admin_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
