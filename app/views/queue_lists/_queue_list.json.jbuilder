json.extract! queue_list, :id, :max_users, :allowed_users, :start_time, :end_time, :created_at, :updated_at
json.url queue_list_url(queue_list, format: :json)
