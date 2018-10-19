require 'test_helper'

class DelegationsControllerTest < ActionController::TestCase
  setup do
    @delegation = delegations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delegations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delegation" do
    assert_difference('Delegation.count') do
      post :create, delegation: { cost_centre_pemberi_id: @delegation.cost_centre_pemberi_id, cost_centre_penerima_id: @delegation.cost_centre_penerima_id, keterangan: @delegation.keterangan, mulai: @delegation.mulai, nomor: @delegation.nomor, pemberi: @delegation.pemberi, penerima: @delegation.penerima, selesai: @delegation.selesai }
    end

    assert_redirected_to delegation_path(assigns(:delegation))
  end

  test "should show delegation" do
    get :show, id: @delegation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delegation
    assert_response :success
  end

  test "should update delegation" do
    patch :update, id: @delegation, delegation: { cost_centre_pemberi_id: @delegation.cost_centre_pemberi_id, cost_centre_penerima_id: @delegation.cost_centre_penerima_id, keterangan: @delegation.keterangan, mulai: @delegation.mulai, nomor: @delegation.nomor, pemberi: @delegation.pemberi, penerima: @delegation.penerima, selesai: @delegation.selesai }
    assert_redirected_to delegation_path(assigns(:delegation))
  end

  test "should destroy delegation" do
    assert_difference('Delegation.count', -1) do
      delete :destroy, id: @delegation
    end

    assert_redirected_to delegations_path
  end
end
