json.extract! user, :id, :email, :dodo_code, :island_name, :character_name, :password_digest, :recovery_password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
