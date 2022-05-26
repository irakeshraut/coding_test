class CreateLandCheckerAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :land_checker_addresses do |t|
      t.bigint :feature_id, null: false
      t.bigint :property_id, null: false
      t.string :full_address, null: :false
      t.integer :lga_code, null: :false
      t.string :state, null: false
      t.integer :postcode, null: :false

      t.timestamps
    end
  end
end
