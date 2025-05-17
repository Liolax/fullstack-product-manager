# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Example fix for 16-byte key requirement:
require "securerandom"

# Fetch secret from ENV or generate a new one (ensure it's 16 bytes)
secret = ENV["CIPHER_SECRET"] || SecureRandom.random_bytes(16)
raise "CIPHER_SECRET must be 16 bytes" unless secret.bytesize == 16

cipher = OpenSSL::Cipher.new("AES-128-CBC")
cipher.key = secret
