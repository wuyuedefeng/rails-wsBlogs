require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module SwBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.assets.precompile << proc.new do |path|
       if path =~ /\.(css|js |scss|png|jpg|gif|js on)\z/
         full_path = rails.application.assets.resolve(path).to_path
         app_assets_path1 = rails.root.join('app', 'assets').to_path
         app_assets_path2 = rails.root.join('public', 'assets').to_path
         app_assets_path3 = rails.root.join('vendor', 'assets').to_path
 
         if full_path.starts_with? app_assets_path1
           true
         else
           if full_path.starts_with? app_assets_path2
             true
           else
             if full_path.starts_with? app_assets_path3
               true
             else
               false
             end
           end
         end
       end
     end

  end
end
