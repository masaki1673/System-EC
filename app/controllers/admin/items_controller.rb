class Admin::ItemsController < ApplicationController
 def new
  @item = Item.new
  # @item = Image_id
  
 end
 def edit
  @item = Item.find(params[:id])
 end
 def update
   @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to admin_item_path(@item.id)
    end
 end
 def index
  @item = Item.all
  @genre = Genre.all
 end
 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
 end
 def create
  @item = Item.new(items_params)
  if @item.save!
      redirect_to admin_item_path(@item)
  end
 end
 private
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
