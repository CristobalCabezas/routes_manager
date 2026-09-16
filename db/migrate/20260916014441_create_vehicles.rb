class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.string :plate, null: false
      t.decimal :capacity_kg, null: false
      t.string :driver_name, null: false
      t.integer :status, null: false

      t.timestamps
    end
    add_index :vehicles, :plate, unique: true
  end
end
