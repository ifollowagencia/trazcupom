class AddFacebookToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :facebook, :string
  end
end
