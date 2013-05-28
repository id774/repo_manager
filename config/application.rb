require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require *Rails.groups(:assets => %w(development test))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module RailsApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Tokyo'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Configuration for repo manager.
    # Please edit following for your environments.

    # config.trash_dir  = "/home/trash"
    # config.git_dir    = "/var/lib/git"
    # config.git_create = "/var/www/bin/git_create.sh"
    # config.git_delete = "/var/www/bin/git_delete.sh"
    # config.svn_dir    = "/var/lib/svn"
    # config.svn_create = "/var/www/bin/svn_create.sh"
    # config.svn_delete = "/var/www/bin/svn_delete.sh"

    # Configuration for the test environments.
    APP_ROOT =  File.join(File.dirname(__FILE__), '..')
    config.trash_dir  = File.join(APP_ROOT, 'test', 'trash')
    config.git_dir    = File.join(APP_ROOT, 'test', 'git')
    config.git_create = File.join(APP_ROOT, 'sh', 'git_create.sh')
    config.git_delete = File.join(APP_ROOT, 'sh', 'git_delete.sh')
    config.svn_dir    = File.join(APP_ROOT, 'test', 'svn')
    config.svn_create = File.join(APP_ROOT, 'sh', 'svn_create.sh')
    config.svn_delete = File.join(APP_ROOT, 'sh', 'svn_delete.sh')

    # The auth information for your apps.
    config.hostname   = "your_hostname"
    config.username   = "your_username"
    config.password   = "your_password"
    config.basic_auth = false

  end
end
