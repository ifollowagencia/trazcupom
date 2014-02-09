class RenameImageEstablishment < ActiveRecord::Migration
  def change
    rename_table :imageestablishments, :image_establishments
  end
end
