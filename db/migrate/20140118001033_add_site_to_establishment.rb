class AddSiteToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :site, :string
  end
end
