require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Skpweb
  class Application < Rails::Application # :nodoc:
    config.load_defaults 5.1

    config.assets.paths << Rails.root.join('vendor/ui-kits')
    config.assets.paths << Rails.root.join('vendor/javascripts')
    config.assets.paths << Rails.root.join('fonts')

    config.time_zone = 'Brasilia'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-BR'
  end
end
