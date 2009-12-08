Cucumber::Rails::World.use_transactional_fixtures = false

Webrat.configure do |config|
  config.mode = :selenium
  #optional:
  config.application_port = 4567 # defaults to 3001. Avoid Selenium's default port, 4444
  config.application_framework = :rails  # could also be :merb. Defaults to :rails
  config.application_environment = :selenium # should equal the environment of the test runner because of database and gem dependencies. Defaults to :test. 
  config.open_error_files = false # Set to true if you want error pages to pop up in the browser
end

require 'database_cleaner'
DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end