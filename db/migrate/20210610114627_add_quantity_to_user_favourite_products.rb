class AddQuantityToUserFavouriteProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :user_favourite_products, :quantity, :integer, default: 1
  end
end
