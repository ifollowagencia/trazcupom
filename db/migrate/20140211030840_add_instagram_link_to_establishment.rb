class AddInstagramLinkToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :instagram_link, :string
  end
end
