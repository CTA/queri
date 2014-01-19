require 'rubygems'
require 'bundler/setup'
require 'queri'
Dir[File.join( File.dirname(__FILE__), 'support', '**', '*.rb' )].each {|f| require f}
#require File.join(File.dirname(__FILE__), '..', 'lib', 'queuemetrics.rb')

RSpec.configure do |config|
  include TimeHelper
  include Constantize
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
