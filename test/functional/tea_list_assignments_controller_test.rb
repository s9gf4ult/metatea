require 'test_helper'

class TeaListAssignmentsControllerTest < ActionController::TestCase
  setup do
    @tea_list_assignment = tea_list_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tea_list_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tea_list_assignment" do
    assert_difference('TeaListAssignment.count') do
      post :create, tea_list_assignment: { list_name: @tea_list_assignment.list_name, tea_id: @tea_list_assignment.tea_id, user_id: @tea_list_assignment.user_id }
    end

    assert_redirected_to tea_list_assignment_path(assigns(:tea_list_assignment))
  end

  test "should show tea_list_assignment" do
    get :show, id: @tea_list_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tea_list_assignment
    assert_response :success
  end

  test "should update tea_list_assignment" do
    put :update, id: @tea_list_assignment, tea_list_assignment: { list_name: @tea_list_assignment.list_name, tea_id: @tea_list_assignment.tea_id, user_id: @tea_list_assignment.user_id }
    assert_redirected_to tea_list_assignment_path(assigns(:tea_list_assignment))
  end

  test "should destroy tea_list_assignment" do
    assert_difference('TeaListAssignment.count', -1) do
      delete :destroy, id: @tea_list_assignment
    end

    assert_redirected_to tea_list_assignments_path
  end
end
