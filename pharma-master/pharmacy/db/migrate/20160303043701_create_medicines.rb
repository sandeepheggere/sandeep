class CreateMedicines < ActiveRecord::Migration
  def self.up
    create_table :medicines do |t|
	 t.string :medicine_name
      t.integer :quantity
      t.integer :dosage
      t.date :expiry_date
      t.timestamps
    end
  end

  def self.down
    drop_table :medicines
  end
end
