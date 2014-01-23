class AddCategoryToEstablishment < ActiveRecord::Migration
  def change
    add_reference :establishments, :categoryestablishment, index: true
  end
end
