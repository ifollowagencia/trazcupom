class CreateAddressestablishments < ActiveRecord::Migration
  def change
    create_table :addressestablishments do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :establishment, index: true

      t.timestamps
    end
  end
end
