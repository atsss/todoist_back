require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Server
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    config.time_zone = 'Tokyo'
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.i18n.enforce_available_locales = true

    config.public_file_server.enabled = true
    config.read_encrypted_secrets = true

    config.x.cors_allowed_origins = ENV['CORS_ALLOWED_ORIGINS']

    config.generators do |g|
      g.template_engine :slim

      g.test_framework nil
      g.factory_bot false

      g.javascripts false
      g.stylesheets false
      g.helper false
      g.jbuilder false
    end
  end
end
