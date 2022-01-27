class OrderDetail < ApplicationRecord
     belongs_to :order
     belongs_to :item
     enum making_status: { not_startable: 0, waiting: 1, constructing: 2, complete: 3}
end
