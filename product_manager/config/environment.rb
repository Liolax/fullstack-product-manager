# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Example fix for 16-byte key requirement:
require "securerandom"

# Fetch secret from ENV (must be exactly 16 bytes)
secret = ENV["CIPHER_SECRET"]
secret_bin = secret&.b # ensure binary encoding

if secret_bin.nil? || secret_bin.bytesize != 16
  raise "CIPHER_SECRET environment variable must be set and exactly 16 bytes (#{secret&.inspect} has #{secret_bin&.bytesize || 0} bytes)"
end

cipher = OpenSSL::Cipher.new("AES-128-CBC")
cipher.key = secret_bin

