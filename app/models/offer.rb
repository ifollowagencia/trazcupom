class Offer < ActiveRecord::Base

  mount_uploader :image1, EstablishmentUploader
  mount_uploader :image2, EstablishmentUploader
  mount_uploader :image3, EstablishmentUploader
  mount_uploader :image4, EstablishmentUploader

  belongs_to :establishment
  belongs_to :product

  has_many :visited_offers

  has_many :downloads

  def self.suggestions_by_category_establishments(current_user)
    offers = []
    category_ids = current_user.visited_offers.group(:category_establishments_id).order("count_all DESC").count.keys
    category_ids.each do |category_id|
      offers.concat(includes(:establishment).where("establishments.categoryestablishment_id = ?", category_id))
    end
    offers
  end

end
