class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.text :description
      t.references :establishment, index: true
      t.references :product, index: true
      t.integer :amount
      t.date :validity
      t.date :date
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.boolean :status

      t.timestamps
    end
  end
end
