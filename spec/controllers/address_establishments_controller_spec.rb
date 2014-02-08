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

  describe 'GET new' do
    it "assigns a new AddressEstablishmet to @address_establishment" do
      get :new
      expect(assigns(:address_establishment)).to be_a_new(AddressEstablishment)
    end

    it "render the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it "assigns the requested AddressEstablishmet to @address_establishment" do
      address_establishment = create(:address_establishment)
      get :edit, id: address_establishment
      expect(assigns(:address_establishment)).to eq address_establishment
    end

    it "render the new template" do
      address_establishment = create(:address_establishment)
      get :edit, id: address_establishment
      expect(response).to render_template :edit
    end
  end

end
