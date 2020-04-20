class QueueList < ApplicationRecord
  belongs_to :listing

  has_many :queue_list_to_users
  has_many :users, through: :queue_list_to_users
end
