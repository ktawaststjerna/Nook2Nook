json.extract! listing, :id, :user_id, :hosting, :selling, :created_at, :updated_at
json.url listing_url(listing, format: :json)
