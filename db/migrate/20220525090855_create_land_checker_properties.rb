class CreateLandCheckerProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :land_checker_properties do |t|
      t.bigint :council_property_number
      t.decimal :longitude, null: false
      t.decimal :latitude, null: false, precision: 18, scale: 15
      t.integer :lga_code, null: false, precision: 18, scale: 16
      t.timestamps
    end
  end
end
