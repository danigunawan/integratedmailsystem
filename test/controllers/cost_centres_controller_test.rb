require 'test_helper'

class CostCentresControllerTest < ActionController::TestCase
  setup do
    @cost_centre = cost_centres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cost_centres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost_centre" do
    assert_difference('CostCentre.count') do
      post :create, cost_centre: { nama: @cost_centre.nama }
    end

    assert_redirected_to cost_centre_path(assigns(:cost_centre))
  end

  test "should show cost_centre" do
    get :show, id: @cost_centre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost_centre
    assert_response :success
  end

  test "should update cost_centre" do
    patch :update, id: @cost_centre, cost_centre: { nama: @cost_centre.nama }
    assert_redirected_to cost_centre_path(assigns(:cost_centre))
  end

  test "should destroy cost_centre" do
    assert_difference('CostCentre.count', -1) do
      delete :destroy, id: @cost_centre
    end

    assert_redirected_to cost_centres_path
  end
end
