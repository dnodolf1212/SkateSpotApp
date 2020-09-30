Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook unless Rails.env.production
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end