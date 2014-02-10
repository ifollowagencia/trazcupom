class RenameCategoryEstablishment < ActiveRecord::Migration
  def change
    rename_table :categoryestablishments, :category_establishments
  end
end
