require 'test_helper'

class DirectoratesControllerTest < ActionController::TestCase
  setup do
    @directorate = directorates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directorates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create directorate" do
    assert_difference('Directorate.count') do
      post :create, directorate: { keterangan: @directorate.keterangan, nama: @directorate.nama }
    end

    assert_redirected_to directorate_path(assigns(:directorate))
  end

  test "should show directorate" do
    get :show, id: @directorate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @directorate
    assert_response :success
  end

  test "should update directorate" do
    patch :update, id: @directorate, directorate: { keterangan: @directorate.keterangan, nama: @directorate.nama }
    assert_redirected_to directorate_path(assigns(:directorate))
  end

  test "should destroy directorate" do
    assert_difference('Directorate.count', -1) do
      delete :destroy, id: @directorate
    end

    assert_redirected_to directorates_path
  end
end
