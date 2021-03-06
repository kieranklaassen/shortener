require 'active_support/dependencies'

module Shortener
  autoload :ActiveRecordExtension, 'shortener/active_record_extension'
  autoload :ShortenUrlInterceptor, 'shortener/shorten_url_interceptor'

  CHARSETS = {
    alphanum: ('a'..'z').to_a + (0..9).to_a,
    alphanumcase: ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a }

  # default key length: 5 characters
  mattr_accessor :unique_key_length
  self.unique_key_length = 5

  # make it possible to set host and protocol for short_url helper
  mattr_accessor :url_options
  self.url_options = {}

  # character set to chose from:
  #  :alphanum     - a-z0-9     -  has about 60 million possible combos
  #  :alphanumcase - a-zA-Z0-9  -  has about 900 million possible combos
  mattr_accessor :charset
  self.charset = :alphanum

  def self.key_chars
    CHARSETS[charset]
  end
end

# Require our railtie and engine
require 'shortener/railtie'
require 'shortener/engine'
