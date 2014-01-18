class CreateLikeestablishments < ActiveRecord::Migration
  def change
    create_table :likeestablishments do |t|
      t.integer :count
      t.references :establishment, index: true

      t.timestamps
    end
  end
end
