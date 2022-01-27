class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :order_details, dependent: :destroy
  attachment :image
  def with_tax_price
  (price * 1.1).floor
  end
end
