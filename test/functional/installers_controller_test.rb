require 'test_helper'

class InstallersControllerTest < ActionController::TestCase
  setup do
    @installer = installers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:installers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create installer" do
    assert_difference('Installer.count') do
      post :create, :installer => @installer.attributes
    end

    assert_redirected_to installer_path(assigns(:installer))
  end

  test "should show installer" do
    get :show, :id => @installer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @installer.to_param
    assert_response :success
  end

  test "should update installer" do
    put :update, :id => @installer.to_param, :installer => @installer.attributes
    assert_redirected_to installer_path(assigns(:installer))
  end

  test "should destroy installer" do
    assert_difference('Installer.count', -1) do
      delete :destroy, :id => @installer.to_param
    end

    assert_redirected_to installers_path
  end
end
