class LikeOffer < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user

  def perform_like
    like = self.class.where(offer: offer, user: user).first
    if like
      like.update_attributes(count: like.count + 1)
    else
      self.class.create(offer: offer, user: user, count: 1)
    end
  end
end
