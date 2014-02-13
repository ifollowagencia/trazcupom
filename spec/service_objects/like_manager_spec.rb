require 'spec_helper'

describe LikeManager do
  let(:like_manager_with_establishment) { LikeManager.new(create(:establishment), create(:user)) }

  let(:like_manager_with_offer) { LikeManager.new(create(:offer), create(:user)) }

  it "should return a valid instance" do
    expect(like_manager_with_establishment).to_not be_nil
  end

  it "perform a like establishment" do
    like_manager_with_establishment.perform_like
    expect(like_manager_with_establishment.count).to be > 0
  end

  it "perform a like offer" do
    like_manager_with_offer.perform_like
    expect(like_manager_with_offer.count).to be > 0
  end

end
