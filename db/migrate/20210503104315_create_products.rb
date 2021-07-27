class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :branch_name
      t.string :image
      t.string :title
      t.text :description
      t.decimal :price
      t.string :product_type
      t.string :model_number

      t.timestamps
    end
  end
end
