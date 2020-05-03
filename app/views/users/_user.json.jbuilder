json.extract! user, :id, :email, :island_name, :character_name, :created_at, :updated_at
json.url user_url(user, format: :json)
