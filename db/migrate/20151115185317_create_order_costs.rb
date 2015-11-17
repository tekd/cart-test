class CreateOrderCosts < ActiveRecord::Migration
  def change
    create_table :order_costs do |t|
      t.integer :destination
      t.float :cost

      t.timestamps null: false
    end
  end
end
