class RenameAddressEstablishment < ActiveRecord::Migration
  def change
    rename_table :addressestablishments, :address_establishments
  end
end
