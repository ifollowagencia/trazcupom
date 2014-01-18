require 'test_helper'

class AddressestablishmentsControllerTest < ActionController::TestCase
  setup do
    @addressestablishment = addressestablishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addressestablishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addressestablishment" do
    assert_difference('Addressestablishment.count') do
      post :create, addressestablishment: { address: @addressestablishment.address, establishment_id: @addressestablishment.establishment_id, latitude: @addressestablishment.latitude, longitude: @addressestablishment.longitude }
    end

    assert_redirected_to addressestablishment_path(assigns(:addressestablishment))
  end

  test "should show addressestablishment" do
    get :show, id: @addressestablishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @addressestablishment
    assert_response :success
  end

  test "should update addressestablishment" do
    patch :update, id: @addressestablishment, addressestablishment: { address: @addressestablishment.address, establishment_id: @addressestablishment.establishment_id, latitude: @addressestablishment.latitude, longitude: @addressestablishment.longitude }
    assert_redirected_to addressestablishment_path(assigns(:addressestablishment))
  end

  test "should destroy addressestablishment" do
    assert_difference('Addressestablishment.count', -1) do
      delete :destroy, id: @addressestablishment
    end

    assert_redirected_to addressestablishments_path
  end
end
