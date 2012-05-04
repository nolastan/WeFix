# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Wefix2::Application.initialize!

Taskrabbit.configure do |config|
  config.client_secret = ENV["tr_secret"] || APP_CONFIG['taskrabbit'][:secret]
end