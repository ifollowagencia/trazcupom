class CreateImageestablishments < ActiveRecord::Migration
  def change
    create_table :imageestablishments do |t|
      t.string :image
      t.references :establishment, index: true

      t.timestamps
    end
  end
end
