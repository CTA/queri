require 'rubygems'
require 'bundler/setup'
require 'queri'
Dir[File.join( File.dirname(__FILE__), 'support', '**', '*.rb' )].each {|f| require f}

RSpec.configure do |config|
  include TimeHelper
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
