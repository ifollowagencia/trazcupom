require 'spec_helper'

describe SyncData do

  let(:user) { create(:user) }

  subject(:sync_data) { SyncData.new(user, 0) }

  it "valid instance" do
    expect(subject).to_not be_nil
  end

  it "should return valid keys" do
    create(:offer)
    create(:establishment)
    expect(subject.perform_sync).to include(:establishments)
    expect(subject.perform_sync).to include(:offers)
    expect(subject.perform_sync).to include(:user)
  end
end
