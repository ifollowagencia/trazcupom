class AddNamefullToUsers < ActiveRecord::Migration
  def change
    add_column :users, :namefull, :string
  end
end
