class CreateCommentestabs < ActiveRecord::Migration
  def change
    create_table :commentestabs do |t|
      t.text :comment
      t.references :establishment, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
