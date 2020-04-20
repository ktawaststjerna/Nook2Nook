json.extract! queue_list_to_user, :id, :queue_id, :user_id, :created_at, :updated_at
json.url queue_list_to_user_url(queue_list_to_user, format: :json)
