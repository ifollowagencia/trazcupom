class AddDescriptionToEstablishment < ActiveRecord::Migration
  def change
    add_column :establishments, :description, :text
  end
end
