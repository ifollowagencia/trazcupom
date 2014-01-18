require 'test_helper'

class CommentestabsControllerTest < ActionController::TestCase
  setup do
    @commentestab = commentestabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commentestabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commentestab" do
    assert_difference('Commentestab.count') do
      post :create, commentestab: { comment: @commentestab.comment, establishment_id: @commentestab.establishment_id, user_id: @commentestab.user_id }
    end

    assert_redirected_to commentestab_path(assigns(:commentestab))
  end

  test "should show commentestab" do
    get :show, id: @commentestab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commentestab
    assert_response :success
  end

  test "should update commentestab" do
    patch :update, id: @commentestab, commentestab: { comment: @commentestab.comment, establishment_id: @commentestab.establishment_id, user_id: @commentestab.user_id }
    assert_redirected_to commentestab_path(assigns(:commentestab))
  end

  test "should destroy commentestab" do
    assert_difference('Commentestab.count', -1) do
      delete :destroy, id: @commentestab
    end

    assert_redirected_to commentestabs_path
  end
end
