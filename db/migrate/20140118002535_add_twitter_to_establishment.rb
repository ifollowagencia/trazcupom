class AddTwitterToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :twitter, :string
  end
end
