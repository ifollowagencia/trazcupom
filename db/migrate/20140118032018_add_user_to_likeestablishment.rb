class AddUserToLikeestablishment < ActiveRecord::Migration
  def change
    add_reference :likeestablishments, :user, index: true
  end
end
