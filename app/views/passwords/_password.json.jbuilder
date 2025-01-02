json.extract! password, :id, :url, :username, :password, :expiration_date, :category_path, :tags, :favorite, :notes, :database_id, :created_at, :updated_at
json.url password_url(password, format: :json)
