require 'test_helper'

class EstadisticasconsultasControllerTest < ActionController::TestCase
  setup do
    @estadisticasconsulta = estadisticasconsultas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estadisticasconsultas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estadisticasconsulta" do
    assert_difference('Estadisticasconsulta.count') do
      post :create, :estadisticasconsulta => @estadisticasconsulta.attributes
    end

    assert_redirected_to estadisticasconsulta_path(assigns(:estadisticasconsulta))
  end

  test "should show estadisticasconsulta" do
    get :show, :id => @estadisticasconsulta.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @estadisticasconsulta.to_param
    assert_response :success
  end

  test "should update estadisticasconsulta" do
    put :update, :id => @estadisticasconsulta.to_param, :estadisticasconsulta => @estadisticasconsulta.attributes
    assert_redirected_to estadisticasconsulta_path(assigns(:estadisticasconsulta))
  end

  test "should destroy estadisticasconsulta" do
    assert_difference('Estadisticasconsulta.count', -1) do
      delete :destroy, :id => @estadisticasconsulta.to_param
    end

    assert_redirected_to estadisticasconsultas_path
  end
end
