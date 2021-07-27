class AddProductPriceToUserFavouriteProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :user_favourite_products, :product_price, :decimal
  end
end
