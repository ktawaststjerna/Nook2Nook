class Item < ApplicationRecord
  self.implicit_order_column = 'created_at'

  belongs_to :listing
end
