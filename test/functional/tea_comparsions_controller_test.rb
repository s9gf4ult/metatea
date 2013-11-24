require 'test_helper'

class TeaComparsionsControllerTest < ActionController::TestCase
  setup do
    @tea_comparsion = tea_comparsions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tea_comparsions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tea_comparsion" do
    assert_difference('TeaComparsion.count') do
      post :create, tea_comparsion: { axis_name: @tea_comparsion.axis_name, left_tea_id: @tea_comparsion.left_tea_id, result: @tea_comparsion.result, right_tea_id: @tea_comparsion.right_tea_id }
    end

    assert_redirected_to tea_comparsion_path(assigns(:tea_comparsion))
  end

  test "should show tea_comparsion" do
    get :show, id: @tea_comparsion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tea_comparsion
    assert_response :success
  end

  test "should update tea_comparsion" do
    put :update, id: @tea_comparsion, tea_comparsion: { axis_name: @tea_comparsion.axis_name, left_tea_id: @tea_comparsion.left_tea_id, result: @tea_comparsion.result, right_tea_id: @tea_comparsion.right_tea_id }
    assert_redirected_to tea_comparsion_path(assigns(:tea_comparsion))
  end

  test "should destroy tea_comparsion" do
    assert_difference('TeaComparsion.count', -1) do
      delete :destroy, id: @tea_comparsion
    end

    assert_redirected_to tea_comparsions_path
  end
end
