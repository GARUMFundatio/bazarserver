require 'test_helper'

class EstdadisticasbazaresControllerTest < ActionController::TestCase
  setup do
    @estdadisticasbazar = estdadisticasbazares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estdadisticasbazares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estdadisticasbazar" do
    assert_difference('Estdadisticasbazar.count') do
      post :create, :estdadisticasbazar => @estdadisticasbazar.attributes
    end

    assert_redirected_to estdadisticasbazar_path(assigns(:estdadisticasbazar))
  end

  test "should show estdadisticasbazar" do
    get :show, :id => @estdadisticasbazar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @estdadisticasbazar.to_param
    assert_response :success
  end

  test "should update estdadisticasbazar" do
    put :update, :id => @estdadisticasbazar.to_param, :estdadisticasbazar => @estdadisticasbazar.attributes
    assert_redirected_to estdadisticasbazar_path(assigns(:estdadisticasbazar))
  end

  test "should destroy estdadisticasbazar" do
    assert_difference('Estdadisticasbazar.count', -1) do
      delete :destroy, :id => @estdadisticasbazar.to_param
    end

    assert_redirected_to estdadisticasbazares_path
  end
end
