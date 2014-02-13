class CreateLikeOffers < ActiveRecord::Migration
  def change
    create_table :like_offers do |t|
      t.integer :offer_id
      t.integer :user_id
      t.integer :count

      t.timestamps
    end
  end
end
