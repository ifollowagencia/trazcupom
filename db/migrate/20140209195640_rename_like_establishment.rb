class RenameLikeEstablishment < ActiveRecord::Migration
  def change
    rename_table :likeestablishments, :like_establishments
  end
end
