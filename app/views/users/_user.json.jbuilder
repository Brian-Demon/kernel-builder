json.extract! user, :id, :provider, :uid, :username, :created_at, :updated_at
json.url user_url(user, format: :json)
