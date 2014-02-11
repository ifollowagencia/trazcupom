class AddFacebookLinkToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :facebook_link, :string
  end
end
