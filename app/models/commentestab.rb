class Commentestab < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :user

  validates_uniqueness_of :user_id
end
