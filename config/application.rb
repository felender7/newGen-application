require_relative 'boot'
require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewGenApplication
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end

  LetterAvatar.setup do |config|
    config.fill_color        = 'rgba(255, 255, 255, 1)' # default is 'rgba(255, 255, 255, 0.65)'
    config.cache_base_path   = 'public/system/lets'     # default is 'public/system'
    config.colors_palette    = :iwanthue                # default is :google
    config.weight            = 500                      # default is 300
    config.annotate_position = '-0+10'                  # default is -0+5
    config.letters_count     = 2                        # default is 1
    config.pointsize         = 70                       # default is 140
  end

end
