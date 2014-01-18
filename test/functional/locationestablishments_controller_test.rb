require 'test_helper'

class LocationestablishmentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Locationestablishment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Locationestablishment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Locationestablishment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to locationestablishment_url(assigns(:locationestablishment))
  end

  def test_edit
    get :edit, :id => Locationestablishment.first
    assert_template 'edit'
  end

  def test_update_invalid
    Locationestablishment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Locationestablishment.first
    assert_template 'edit'
  end

  def test_update_valid
    Locationestablishment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Locationestablishment.first
    assert_redirected_to locationestablishment_url(assigns(:locationestablishment))
  end

  def test_destroy
    locationestablishment = Locationestablishment.first
    delete :destroy, :id => locationestablishment
    assert_redirected_to locationestablishments_url
    assert !Locationestablishment.exists?(locationestablishment.id)
  end
end
