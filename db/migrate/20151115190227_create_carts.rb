class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.float :total, default: 0.00

      t.timestamps null: false
    end
  end
end
