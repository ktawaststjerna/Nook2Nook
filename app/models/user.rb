class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :join_listings
  has_many :host_listings
  has_many :notifications

  # has_secure_password

  validates :island_name, :character_name, :encrypted_password, :email, presence: true

  def self.create_password
    # SecureRandom.hex(8)
    Devise.friendly_token
  end
end