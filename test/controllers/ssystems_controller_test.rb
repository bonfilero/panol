require 'test_helper'

class SsystemsControllerTest < ActionController::TestCase
  setup do
    @ssystem = ssystems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ssystems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ssystem" do
    assert_difference('Ssystem.count') do
      post :create, ssystem: { nombre: @ssystem.nombre, system_id: @ssystem.system_id }
    end

    assert_redirected_to ssystem_path(assigns(:ssystem))
  end

  test "should show ssystem" do
    get :show, id: @ssystem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ssystem
    assert_response :success
  end

  test "should update ssystem" do
    patch :update, id: @ssystem, ssystem: { nombre: @ssystem.nombre, system_id: @ssystem.system_id }
    assert_redirected_to ssystem_path(assigns(:ssystem))
  end

  test "should destroy ssystem" do
    assert_difference('Ssystem.count', -1) do
      delete :destroy, id: @ssystem
    end

    assert_redirected_to ssystems_path
  end
end
