class QueueList < ApplicationRecord
  belongs_to :listing

  has_many :queue_list_to_users
  has_many :users, through: :queue_list_to_users

  def join_queue(user_id)
    return false if users.pluck(:id).include?(user_id)
    return false if users.count > max_users
    QueueListToUser.create!(
      user_id: user_id,
      queue_list_id: id
    )
  end

  def get_allowed_users
    user_ids = queue_list_to_users.order(created_at: :desc).limit(allowed_users).pluck(:user_id)
    users.where(id: user_ids)
  end
end
