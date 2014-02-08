require 'spec_helper'

describe AddressEstablishmentsController do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET index' do

    it 'populates an array' do
      address_establishments = create(:address_establishment)
      get :index
      expect(assigns(:address_establishments)).to eq [address_establishments]
    end

    it 'render the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end
