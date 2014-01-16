class AddAdressToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :adress, :string
  end
end
