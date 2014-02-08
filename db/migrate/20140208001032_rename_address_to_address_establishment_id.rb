class RenameAddressToAddressEstablishmentId < ActiveRecord::Migration
  def change
    rename_column :establishments, :adress, :address_establishment_id
  end
end
