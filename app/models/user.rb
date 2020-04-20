class User < ApplicationRecord
  has_many :listings
  has_many :queue_list_to_users
  has_many :queue_lists, through: :queue_list_to_users
end