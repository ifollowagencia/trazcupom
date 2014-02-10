class RenameCategoryEstablishmentIdFromEstablishment < ActiveRecord::Migration
  def change
    rename_column :establishments, :categoryestablishment_id, :category_establishment_id
  end
end
