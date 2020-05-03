class User < ApplicationRecord
  has_many :join_listings
  has_many :host_listings
  has_many :notifications

  has_secure_password

  validates :island_name, :character_name, :password_digest, :email, presence: true

  def self.create_password
    SecureRandom.hex(8)
  end
end