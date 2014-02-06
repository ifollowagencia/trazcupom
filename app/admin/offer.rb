ActiveAdmin.register Offer do

 permit_params :name, :description, :amount, :validity, :date,
    :image1, :image2, :image3, :image4, :status

  index do
    column :name
    column :description
    column :amount
    column :validity
    column :status

    default_actions
  end

  filter :name

  form(html: { multipart: true }) do |f|
    f.inputs "New Offer" do
      f.input       :name
      f.input       :description
      f.input       :amount
      f.input       :status
      f.input       :validity,  as: :date_picker
      f.input       :date,      as: :date_picker
      f.input       :image1,    as: :file
      f.input       :image2,    as: :file
      f.input       :image3,    as: :file
      f.input       :image4,    as: :file
    end
    f.actions
  end


end
