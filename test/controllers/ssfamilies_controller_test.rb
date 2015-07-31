require 'test_helper'

class SsfamiliesControllerTest < ActionController::TestCase
  setup do
    @ssfamily = ssfamilies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ssfamilies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ssfamily" do
    assert_difference('Ssfamily.count') do
      post :create, ssfamily: { desc: @ssfamily.desc, nombre: @ssfamily.nombre, sfamily_id: @ssfamily.sfamily_id }
    end

    assert_redirected_to ssfamily_path(assigns(:ssfamily))
  end

  test "should show ssfamily" do
    get :show, id: @ssfamily
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ssfamily
    assert_response :success
  end

  test "should update ssfamily" do
    patch :update, id: @ssfamily, ssfamily: { desc: @ssfamily.desc, nombre: @ssfamily.nombre, sfamily_id: @ssfamily.sfamily_id }
    assert_redirected_to ssfamily_path(assigns(:ssfamily))
  end

  test "should destroy ssfamily" do
    assert_difference('Ssfamily.count', -1) do
      delete :destroy, id: @ssfamily
    end

    assert_redirected_to ssfamilies_path
  end
end
