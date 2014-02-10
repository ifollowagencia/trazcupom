class ImageEstablishment < ActiveRecord::Base

  mount_uploader :image, ImageEstablishmentsUploader

  belongs_to :establishment
end
