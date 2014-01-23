class CreateCategoryestablishments < ActiveRecord::Migration
  def change
    create_table :categoryestablishments do |t|
      t.string :name

      t.timestamps
    end
  end
end
