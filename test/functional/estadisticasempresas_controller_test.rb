require 'test_helper'

class EstadisticasempresasControllerTest < ActionController::TestCase
  setup do
    @estadisticasempresa = estadisticasempresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estadisticasempresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estadisticasempresa" do
    assert_difference('Estadisticasempresa.count') do
      post :create, :estadisticasempresa => @estadisticasempresa.attributes
    end

    assert_redirected_to estadisticasempresa_path(assigns(:estadisticasempresa))
  end

  test "should show estadisticasempresa" do
    get :show, :id => @estadisticasempresa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @estadisticasempresa.to_param
    assert_response :success
  end

  test "should update estadisticasempresa" do
    put :update, :id => @estadisticasempresa.to_param, :estadisticasempresa => @estadisticasempresa.attributes
    assert_redirected_to estadisticasempresa_path(assigns(:estadisticasempresa))
  end

  test "should destroy estadisticasempresa" do
    assert_difference('Estadisticasempresa.count', -1) do
      delete :destroy, :id => @estadisticasempresa.to_param
    end

    assert_redirected_to estadisticasempresas_path
  end
end
