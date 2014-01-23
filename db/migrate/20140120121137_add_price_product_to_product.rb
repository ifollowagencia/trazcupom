class AddPriceProductToProduct < ActiveRecord::Migration
  def change
    add_column :products, :priceproduct,  :decimal, :precision => 8, :scale => 2
  end
end
