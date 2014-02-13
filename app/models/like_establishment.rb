class LikeEstablishment < ActiveRecord::Base
  belongs_to :establishment
  belongs_to :user

  def perform_like
    like = self.class.where(establishment: establishment, user: user).first
    if like
      like.update_attributes(count: like.count + 1)
    else
      self.class.create(establishment: establishment, user: user, count: 1)
    end
  end
end
