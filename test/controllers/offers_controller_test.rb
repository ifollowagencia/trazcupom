require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { amount: @offer.amount, date: @offer.date, description: @offer.description, establishment_id: @offer.establishment_id, image1: @offer.image1, image2: @offer.image2, image3: @offer.image3, image4: @offer.image4, name: @offer.name, product_id: @offer.product_id, status: @offer.status, validity: @offer.validity }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { amount: @offer.amount, date: @offer.date, description: @offer.description, establishment_id: @offer.establishment_id, image1: @offer.image1, image2: @offer.image2, image3: @offer.image3, image4: @offer.image4, name: @offer.name, product_id: @offer.product_id, status: @offer.status, validity: @offer.validity }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
