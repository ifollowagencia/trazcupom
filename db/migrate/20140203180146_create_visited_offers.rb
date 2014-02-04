class CreateVisitedOffers < ActiveRecord::Migration
  def change
    create_table :visited_offers do |t|
      t.integer :user_id
      t.integer :offer_id
      t.integer :category_establishments_id
      t.timestamps
    end
  end
end
