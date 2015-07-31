require 'test_helper'

class SfamiliesControllerTest < ActionController::TestCase
  setup do
    @sfamily = sfamilies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sfamilies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sfamily" do
    assert_difference('Sfamily.count') do
      post :create, sfamily: { desc: @sfamily.desc, family_id: @sfamily.family_id, nombre: @sfamily.nombre }
    end

    assert_redirected_to sfamily_path(assigns(:sfamily))
  end

  test "should show sfamily" do
    get :show, id: @sfamily
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sfamily
    assert_response :success
  end

  test "should update sfamily" do
    patch :update, id: @sfamily, sfamily: { desc: @sfamily.desc, family_id: @sfamily.family_id, nombre: @sfamily.nombre }
    assert_redirected_to sfamily_path(assigns(:sfamily))
  end

  test "should destroy sfamily" do
    assert_difference('Sfamily.count', -1) do
      delete :destroy, id: @sfamily
    end

    assert_redirected_to sfamilies_path
  end
end
