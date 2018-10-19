require 'test_helper'

class DispositionDetailsControllerTest < ActionController::TestCase
  setup do
    @disposition_detail = disposition_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disposition_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disposition_detail" do
    assert_difference('DispositionDetail.count') do
      post :create, disposition_detail: { laporan: @disposition_detail.laporan, nomor: @disposition_detail.nomor, penerima: @disposition_detail.penerima, status: @disposition_detail.status, tgl_laporan: @disposition_detail.tgl_laporan }
    end

    assert_redirected_to disposition_detail_path(assigns(:disposition_detail))
  end

  test "should show disposition_detail" do
    get :show, id: @disposition_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disposition_detail
    assert_response :success
  end

  test "should update disposition_detail" do
    patch :update, id: @disposition_detail, disposition_detail: { laporan: @disposition_detail.laporan, nomor: @disposition_detail.nomor, penerima: @disposition_detail.penerima, status: @disposition_detail.status, tgl_laporan: @disposition_detail.tgl_laporan }
    assert_redirected_to disposition_detail_path(assigns(:disposition_detail))
  end

  test "should destroy disposition_detail" do
    assert_difference('DispositionDetail.count', -1) do
      delete :destroy, id: @disposition_detail
    end

    assert_redirected_to disposition_details_path
  end
end
