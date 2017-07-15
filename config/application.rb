require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyRogues
  class Application < Rails::Application
    config.before_configuration do
      env_file = Rails.root.join("config", 'config.yml').to_s
      if File.exists?(env_file)
        YAML.load_file(env_file).each do |key, value|
          ENV[key.to_s] = value
        end
      end
    end

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config do
      require "pry"
      config.console = Pry
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
