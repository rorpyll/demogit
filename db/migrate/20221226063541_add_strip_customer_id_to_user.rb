class AddStripCustomerIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stripe_customer_id, :string
    add_column :products, :stripe_price_id, :string
  end
end
