class CreateDeliveryOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :delivery_orders do |t|
      t.string :code, null: false
      t.decimal :weight_kg, null: false
      t.string :destination_address, null: false
      t.integer :status, null: false
      t.date :scheduled_date, null: false

      t.timestamps
    end
    add_index :delivery_orders, :code, unique: true
  end
end
