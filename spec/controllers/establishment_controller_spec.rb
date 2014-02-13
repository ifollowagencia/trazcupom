require 'spec_helper'

describe EstablishmentsController do
  before { sign_in create(:user) }
  describe "like" do
    it "a establishment" do
      establishment = create(:establishment)
      post :like, establishment_id: establishment.id, format: :js
      expect(response).to render_template 'establishments/like'
    end
  end
end
