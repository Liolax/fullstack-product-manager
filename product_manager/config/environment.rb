# Load the Rails application.
require_relative "application"

# Ensure CIPHER_SECRET is set and exactly 16 bytes
if Rails.env.production?
  cipher_secret = ENV["CIPHER_SECRET"] || raise("CIPHER_SECRET environment variable is not set")
  raise "CIPHER_SECRET must be exactly 16 bytes" unless cipher_secret.bytesize == 16
else
  cipher_secret = ENV["CIPHER_SECRET"] || "dev_secret_12345" # 16 bytes
  raise "CIPHER_SECRET must be exactly 16 bytes" unless cipher_secret.bytesize == 16
end

# Initialize the Rails application.
Rails.application.initialize!

