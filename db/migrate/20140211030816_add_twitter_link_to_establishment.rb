class AddTwitterLinkToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :twitter_link, :string
  end
end
