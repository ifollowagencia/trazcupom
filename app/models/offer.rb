class Offer < ActiveRecord::Base


  
  

  mount_uploader :image1, EstablishmentUploader	
  mount_uploader :image2, EstablishmentUploader	
  mount_uploader :image3, EstablishmentUploader	
  mount_uploader :image4, EstablishmentUploader

  belongs_to :establishment
  belongs_to :product

end
