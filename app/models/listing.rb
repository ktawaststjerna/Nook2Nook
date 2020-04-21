class Listing < ApplicationRecord
  belongs_to :user
  has_one :queue_list

  scope :not_hosting_not_selling, -> { where(hosting: false, selling: false) }
  scope :not_hosting_selling, -> { where(hosting: false, selling: true) }
  scope :hosting_not_selling, -> { where(hosting: true, selling: false) }
  scope :hosting_selling, -> { where(hosting: true, selling: true) }

  def self.create_not_hosting_not_selling!(user_id, item_id, amount_minimum, amount_maximum)
    Listing.create!(
      user_id: user_id,
      hosting: false,
      selling: false,
      item_id: item_id,
      amount_minimum: amount_minimum,
      amount_maximum: amount_maximum
    )
  end

  def self.create_not_hosting_selling!(user_id, item_id, amount_minimum, amount_maximum)
    Listing.create!(
      user_id: user_id,
      hosting: false,
      selling: true,
      item_id: item_id,
      amount_minimum: amount_minimum,
      amount_maximum: amount_maximum
    )
  end

  def self.create_hosting_not_selling!(user_id, item_id, amount, max_users, allowed_users, start_time, end_time)
    listing = Listing.new(
      user_id: user_id,
      hosting: true,
      selling: false,
      item_id: item_id,
      amount: amount
    )

    queue_list = QueueList.new(
      max_users: max_users,
      allowed_users: allowed_users,
      start_time: start_time,
      end_time: end_time
    )

    queue_list.listing = listing

    ActiveRecord::Base.transaction do
      begin
        listing.save!
        queue_list.save!
      rescue Exception => error
        return error
      end
    end

    listing
  end

  def self.create_hosting_selling!(user_id, item_id, amount, max_users, allowed_users, start_time, end_time)
    listing = Listing.new(
      user_id: user_id,
      hosting: true,
      selling: true,
      item_id: item_id,
      amount: amount
    )

    queue_list = QueueList.new(
      max_users: max_users,
      allowed_users: allowed_users,
      start_time: start_time,
      end_time: end_time
    )

    queue_list.listing = listing

    ActiveRecord::Base.transaction do
      begin
        listing.save!
        queue_list.save!
      rescue Exception => error
        return error
      end
    end

    listing
  end
end