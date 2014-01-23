class AddPriceProductToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :priceproduct, :decimal, :precision => 8, :scale => 2
  end
end
