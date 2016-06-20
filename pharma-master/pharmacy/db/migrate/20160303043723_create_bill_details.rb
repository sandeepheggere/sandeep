class CreateBillDetails < ActiveRecord::Migration
  def self.up
    create_table :bill_details do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_details
  end
end
