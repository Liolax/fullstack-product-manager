class AddDefaultToProductAvailable < ActiveRecord::Migration[8.0]
  def change
    change_column_default :products, :available, from: nil, to: true
  end
end
