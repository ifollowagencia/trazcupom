class VisitedOffer < ActiveRecord::Base

  belongs_to :offer
  belongs_to :user

  scope :most_visited, -> { group(:category_establishments_id).order("count_all DESC") }
end
