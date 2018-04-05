class CreateBillboards < ActiveRecord::Migration[5.1]
  def change
    create_table :billboards do |t|
      t.string :vendor_name
      t.string :unit_id
      t.float :price
      t.datetime :start_date
      t.datetime :end_date
      t.float :latitude
      t.float :longitude
      t.boolean :creative_asset

      t.timestamps
    end
  end
end
