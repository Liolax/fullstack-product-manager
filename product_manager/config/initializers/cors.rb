# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://fullstack-product-manager.vercel.app",
            "https://product-manager-client-ten.vercel.app",
            "https://product-manager-client-7wm8mmpib-liolaxs-projects.vercel.app",
            "http://localhost:3001"
    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
