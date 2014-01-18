class Likeestablishment < ActiveRecord::Base
  belongs_to :establishment
  validates_uniqueness_of :user_id
end
