class CreateCatches < ActiveRecord::Migration
  def change
    create_table :catches do |t|
      t.date :dateinit
      t.date :dateend
      t.references :offer, index: true

      t.timestamps
    end
  end
end
