require 'test_helper'

class LikeestablishmentsControllerTest < ActionController::TestCase
  setup do
    @likeestablishment = likeestablishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:likeestablishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create likeestablishment" do
    assert_difference('Likeestablishment.count') do
      post :create, likeestablishment: { count: @likeestablishment.count, establishment_id: @likeestablishment.establishment_id }
    end

    assert_redirected_to likeestablishment_path(assigns(:likeestablishment))
  end

  test "should show likeestablishment" do
    get :show, id: @likeestablishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @likeestablishment
    assert_response :success
  end

  test "should update likeestablishment" do
    patch :update, id: @likeestablishment, likeestablishment: { count: @likeestablishment.count, establishment_id: @likeestablishment.establishment_id }
    assert_redirected_to likeestablishment_path(assigns(:likeestablishment))
  end

  test "should destroy likeestablishment" do
    assert_difference('Likeestablishment.count', -1) do
      delete :destroy, id: @likeestablishment
    end

    assert_redirected_to likeestablishments_path
  end
end
