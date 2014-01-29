class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.references :offer, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
