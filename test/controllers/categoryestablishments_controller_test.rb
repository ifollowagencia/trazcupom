require 'test_helper'

class CategoryestablishmentsControllerTest < ActionController::TestCase
  setup do
    @categoryestablishment = categoryestablishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categoryestablishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categoryestablishment" do
    assert_difference('Categoryestablishment.count') do
      post :create, categoryestablishment: { name: @categoryestablishment.name }
    end

    assert_redirected_to categoryestablishment_path(assigns(:categoryestablishment))
  end

  test "should show categoryestablishment" do
    get :show, id: @categoryestablishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categoryestablishment
    assert_response :success
  end

  test "should update categoryestablishment" do
    patch :update, id: @categoryestablishment, categoryestablishment: { name: @categoryestablishment.name }
    assert_redirected_to categoryestablishment_path(assigns(:categoryestablishment))
  end

  test "should destroy categoryestablishment" do
    assert_difference('Categoryestablishment.count', -1) do
      delete :destroy, id: @categoryestablishment
    end

    assert_redirected_to categoryestablishments_path
  end
end
