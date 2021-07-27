class AddReferencesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, index: true
  end
end
