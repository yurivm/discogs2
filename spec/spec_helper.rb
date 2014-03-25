if ENV['SIMPLECOV']
  require 'simplecov'
  SimpleCov.start 
end

require 'bundler/setup'
Bundler.setup

require 'discogs2'
require 'json'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { :record => :new_episodes, :re_record_interval => 7200 }
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # some (optional) config here
  #VCR
  config.treat_symbols_as_metadata_keys_with_true_values = true
  #config.extend VCR::RSpec::Macros
end

