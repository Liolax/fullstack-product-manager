Rails.application.routes.draw do
  # Health check route for Render
  get '/health', to: proc { [200, {}, ['OK']] }

  # Root route (replace 'products#index' with your actual controller#action if needed)
  root to: "products#index"

  # Optionally, explicitly handle HEAD requests to root
  match "/", to: "products#index", via: [:get, :head]

  resources :products
end
