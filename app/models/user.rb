class User < ApplicationRecord
  has_many :join_listings
  has_many :host_listings
end