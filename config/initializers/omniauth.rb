Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.credentials.dig(:github, :api_key), Rails.application.credentials.dig(:github, :api_secret), scope: "user"
end