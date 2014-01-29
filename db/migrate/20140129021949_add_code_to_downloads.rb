class AddCodeToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :code, :string
  end
end
