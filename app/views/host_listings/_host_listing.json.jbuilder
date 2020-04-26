json.extract! host_listing, :id, :user_id, :item_id, :selling, :amount, :start_date, :end_date, :max_users, :allowed_users, :created_at, :updated_at
json.url host_listing_url(host_listing, format: :json)
