class Addressestablishment < ActiveRecord::Base
  belongs_to :establishment
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
