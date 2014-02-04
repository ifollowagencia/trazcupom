class Establishment < ActiveRecord::Base
  belongs_to :city
  belongs_to :plan
  belongs_to :establishment

  has_many :offers
  has_many :products

  validates :email, uniqueness: true
  mount_uploader :imageprofile, EstablishmentUploader

end
