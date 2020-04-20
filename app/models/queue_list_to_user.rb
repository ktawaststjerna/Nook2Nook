class QueueListToUser < ApplicationRecord
  belongs_to :user
  belongs_to :queue_list
end
