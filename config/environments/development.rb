# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false


# clearance config options
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
HOST = 'localhost:3000'

# mongomapper connection
MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017, :auto_reconnect => true, :logger => Rails.logger)
MongoMapper.database = "forminator-#{Rails.env}"
