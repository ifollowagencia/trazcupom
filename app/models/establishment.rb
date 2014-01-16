class Establishment < ActiveRecord::Base
  validates :email, uniqueness: true
  mount_uploader :imageprofile, EstablishmentUploader	

  belongs_to :city
  belongs_to :plan
  
  has_many :products




end
