class Establishment < ActiveRecord::Base
  belongs_to :city
  belongs_to :plan
  belongs_to :category_establishment

  has_many :offers
  has_many :products
  has_many :like_establishments

  validates :email, uniqueness: true
  mount_uploader :imageprofile, EstablishmentUploader

  scope :newest, lambda {|updated_at| where("updated_at > ?", updated_at)}

end
