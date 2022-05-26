class CreateLandCheckerLgas < ActiveRecord::Migration[7.0]
  def change
    create_table :land_checker_lgas do |t|
      t.integer :code, null: false
      t.string  :name, null: false
      t.string  :long_name, null: false
      t.timestamps
    end
  end
end
