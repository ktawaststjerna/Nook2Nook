class Notification < ApplicationRecord
  belongs_to :user
  scope :unread, -> { where(read: [nil, false]) }
  scope :read, -> { where(read: true) }

end
