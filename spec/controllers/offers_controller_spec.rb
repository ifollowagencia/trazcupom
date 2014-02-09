require 'spec_helper'

describe OffersController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'show offerts' do
    offer = create(:offer)
    get :show, id: offer
    expect(assigns(:offer)).to eq offer
  end
end
