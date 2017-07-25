json.extract! secret, :id, :description, :available, :needed, :splits, :created_at, :updated_at
json.url secret_url(secret, format: :json)
