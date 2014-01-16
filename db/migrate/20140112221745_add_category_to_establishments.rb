class AddCategoryToEstablishments < ActiveRecord::Migration
  def change
    add_reference :establishments, :category, index: true
  end
end
