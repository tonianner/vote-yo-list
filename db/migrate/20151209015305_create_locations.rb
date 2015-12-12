class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :place_name

      t.timestamps null: false
    end
  end
end
