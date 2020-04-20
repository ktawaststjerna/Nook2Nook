class Listing < ApplicationRecord
  self.implicit_order_column = 'created_at'

  belongs_to :user

  has_many :items
end