json.extract! database, :id, :name, :user_id, :created_at, :updated_at
json.url database_url(database, format: :json)
