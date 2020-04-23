class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_one :queue_list

  scope :not_hosting_not_selling, -> { where(hosting: false, selling: false) }
  scope :not_hosting_selling, -> { where(hosting: false, selling: true) }
  scope :hosting_not_selling, -> { where(hosting: true, selling: false) }
  scope :hosting_selling, -> { where(hosting: true, selling: true) }
  scope :active, -> { where('start_time <= ? AND end_time >= ?', DateTime.now, DateTime.now) }

  def max_users
    queue_list&.max_users
  end

  def allowed_users
    queue_list&.allowed_users
  end

  def self.create_listing(params)
    create_not_hosting_not_selling!(params[:user_id], params[:item_id], params[:amount_minimum], params[:amount_maximum], params[:start_time], params[:end_time]) if !params[:hosting] && !params[:selling]
    create_not_hosting_selling!(params[:user_id], params[:item_id], params[:amount_minimum], params[:amount_maximum], params[:start_time], params[:end_time]) if !params[:hosting] && params[:selling]
    create_hosting_not_selling!(params[:user_id], params[:item_id], params[:max_users], params[:allowed_users], params[:start_time], params[:end_time]) if params[:hosting] && !params[:selling]
    create_hosting_selling!(params[:user_id], params[:item_id], params[:max_users], params[:allowed_users], params[:start_time], params[:end_time]) if params[:hosting] && params[:selling]
  end

  def self.create_not_hosting_not_selling!(user_id, item_id, amount_minimum, amount_maximum, start_time, end_time)
    listing = Listing.create!(
      user_id: user_id,
      hosting: false,
      selling: false,
      item_id: item_id,
      amount_minimum: amount_minimum,
      amount_maximum: amount_maximum,
      start_time: start_time,
      end_time: end_time,
    )

    # EnqueueListingJob.perform_later(listing)
  end

  def self.create_not_hosting_selling!(user_id, item_id, amount_minimum, amount_maximum, start_time, end_time)
    Listing.create!(
      user_id: user_id,
      hosting: false,
      selling: true,
      item_id: item_id,
      amount_minimum: amount_minimum,
      amount_maximum: amount_maximum,
      start_time: start_time,
      end_time: end_time,
    )
  end

  def self.create_hosting_not_selling!(user_id, item_id, amount, max_users, allowed_users, start_time, end_time)
    listing = Listing.new(
      user_id: user_id,
      hosting: true,
      selling: false,
      item_id: item_id,
      amount: amount,
      start_time: start_time,
      end_time: end_time,
    )

    queue_list = QueueList.new(
      max_users: max_users,
      allowed_users: allowed_users,
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
      amount: amount,
      start_time: start_time,
      end_time: end_time,
    )

    queue_list = QueueList.new(
      max_users: max_users,
      allowed_users: allowed_users,
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