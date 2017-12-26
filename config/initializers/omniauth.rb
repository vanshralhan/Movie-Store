Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "875829959136178", "APP_SECRET"
end
