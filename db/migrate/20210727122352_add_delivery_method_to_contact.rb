class AddDeliveryMethodToContact < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :delivery_method, :string
  end
end
