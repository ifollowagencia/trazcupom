require 'spec_helper'

describe OffersController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end


  describe 'GET index' do
    it 'populates an array' do
      offers = create(:offer)
      get :index
      expect(assigns(:offers)).to eq [offers]
    end

    it 'render the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET new' do
    it "assigns a new AddressEstablishmet to @offer" do
      get :new
      expect(assigns(:offer)).to be_a_new(Offer)
    end

    it "render the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET edit' do
    it "assigns the requested AddressEstablishmet to @offer" do
      offer = create(:offer)
      get :edit, id: offer
      expect(assigns(:offer)).to eq offer
    end

    it "render the new template" do
      offer = create(:offer)
      get :edit, id: offer
      expect(response).to render_template :edit
    end
  end

  describe 'GET show' do
    it 'show offerts' do
      offer = create(:offer)
      get :show, id: offer
      expect(assigns(:offer)).to eq offer
    end

    it "render the show template" do
      offer = create(:offer)
      get :show, id: offer
      expect(response).to render_template :show
    end
  end
end
