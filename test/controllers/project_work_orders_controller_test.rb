require 'test_helper'

class ProjectWorkOrdersControllerTest < ActionController::TestCase
  setup do
    @project_work_order = project_work_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_work_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_work_order" do
    assert_difference('ProjectWorkOrder.count') do
      post :create, project_work_order: { attachment: @project_work_order.attachment, date: @project_work_order.date, description: @project_work_order.description, number: @project_work_order.number, project_contract_id: @project_work_order.project_contract_id, title: @project_work_order.title }
    end

    assert_redirected_to project_work_order_path(assigns(:project_work_order))
  end

  test "should show project_work_order" do
    get :show, id: @project_work_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_work_order
    assert_response :success
  end

  test "should update project_work_order" do
    patch :update, id: @project_work_order, project_work_order: { attachment: @project_work_order.attachment, date: @project_work_order.date, description: @project_work_order.description, number: @project_work_order.number, project_contract_id: @project_work_order.project_contract_id, title: @project_work_order.title }
    assert_redirected_to project_work_order_path(assigns(:project_work_order))
  end

  test "should destroy project_work_order" do
    assert_difference('ProjectWorkOrder.count', -1) do
      delete :destroy, id: @project_work_order
    end

    assert_redirected_to project_work_orders_path
  end
end
