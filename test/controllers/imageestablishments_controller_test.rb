require 'test_helper'

class ImageestablishmentsControllerTest < ActionController::TestCase
  setup do
    @imageestablishment = imageestablishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imageestablishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imageestablishment" do
    assert_difference('Imageestablishment.count') do
      post :create, imageestablishment: { establishment_id: @imageestablishment.establishment_id, image: @imageestablishment.image }
    end

    assert_redirected_to imageestablishment_path(assigns(:imageestablishment))
  end

  test "should show imageestablishment" do
    get :show, id: @imageestablishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imageestablishment
    assert_response :success
  end

  test "should update imageestablishment" do
    patch :update, id: @imageestablishment, imageestablishment: { establishment_id: @imageestablishment.establishment_id, image: @imageestablishment.image }
    assert_redirected_to imageestablishment_path(assigns(:imageestablishment))
  end

  test "should destroy imageestablishment" do
    assert_difference('Imageestablishment.count', -1) do
      delete :destroy, id: @imageestablishment
    end

    assert_redirected_to imageestablishments_path
  end
end
