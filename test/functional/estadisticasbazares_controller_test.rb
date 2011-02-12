require 'test_helper'

class EstadisticasbazaresControllerTest < ActionController::TestCase
  setup do
    @estadisticasbazar = estadisticasbazares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estadisticasbazares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estadisticasbazar" do
    assert_difference('Estadisticasbazar.count') do
      post :create, :estadisticasbazar => @estadisticasbazar.attributes
    end

    assert_redirected_to estadisticasbazar_path(assigns(:estadisticasbazar))
  end

  test "should show estadisticasbazar" do
    get :show, :id => @estadisticasbazar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @estadisticasbazar.to_param
    assert_response :success
  end

  test "should update estadisticasbazar" do
    put :update, :id => @estadisticasbazar.to_param, :estadisticasbazar => @estadisticasbazar.attributes
    assert_redirected_to estadisticasbazar_path(assigns(:estadisticasbazar))
  end

  test "should destroy estadisticasbazar" do
    assert_difference('Estadisticasbazar.count', -1) do
      delete :destroy, :id => @estadisticasbazar.to_param
    end

    assert_redirected_to estadisticasbazares_path
  end
end
