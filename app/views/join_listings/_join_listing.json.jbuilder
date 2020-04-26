json.extract! join_listing, :id, :user_id, :item_id, :selling, :amount_min, :amount_max, :start_date, :end_date, :created_at, :updated_at
json.url join_listing_url(join_listing, format: :json)
