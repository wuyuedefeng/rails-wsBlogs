# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( ckeditor/* )

# in config/initializers/ckeditor.rb

Ckeditor.setup do |config|
  config.assets_languages = ['en', 'CH-ZH']
  config.assets_plugins = ['image', 'smiley']
end
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
