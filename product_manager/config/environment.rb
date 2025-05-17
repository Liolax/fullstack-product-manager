# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Example fix for 16-byte key requirement:
require "securerandom"

# Fetch secret from ENV (must be exactly 16 bytes)
secret = ENV["CIPHER_SECRET"]
if secret.nil? || secret.bytesize != 16
  raise "CIPHER_SECRET environment variable must be set and exactly 16 bytes (got #{secret&.bytesize || 0})"
end

cipher = OpenSSL::Cipher.new("AES-128-CBC")
cipher.key = secret

