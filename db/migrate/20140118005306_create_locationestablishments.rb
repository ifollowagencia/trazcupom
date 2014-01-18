class CreateLocationestablishments < ActiveRecord::Migration
  def self.up
    create_table :locationestablishments do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :establishment
      t.timestamps
    end
  end

  def self.down
    drop_table :locationestablishments
  end
end
