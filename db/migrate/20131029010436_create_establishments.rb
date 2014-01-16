class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email
      t.string :password
      t.string :cnpj
      t.string :reason
      t.references :city, index: true
      t.references :plan, index: true
      t.string :imageprofile

      t.timestamps
    end
  end
end
