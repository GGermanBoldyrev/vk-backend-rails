require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Настройка CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Разрешить запросы от всех доменов (или укажите конкретный домен)
        resource '*',
          headers: :any, # Разрешить все заголовки
          methods: [:get, :post, :put, :patch, :delete, :options, :head], # Разрешенные HTTP-методы
          expose: ['X-Auth-Token'] # Разрешить клиенту видеть заголовок 'X-Auth-Token'
      end
    end
  end
end
