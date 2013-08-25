config_file = "#{Rails.root.to_s}/config/oauth_providers.yml"

if File.exists?(config_file)
  settings = YAML::load(File.open(config_file))
  settings = settings[Rails.env].deep_symbolize_keys
  if settings
    Devise.setup do |config|
      settings.each do |provider, settings|
        key    = settings.delete(:key)
        secret = settings.delete(:secret)
        config.omniauth provider, key, secret, settings
      end
    end
  end
end

