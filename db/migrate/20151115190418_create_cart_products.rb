class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :cart_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
