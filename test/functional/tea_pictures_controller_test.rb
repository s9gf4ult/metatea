require 'test_helper'

class TeaPicturesControllerTest < ActionController::TestCase
  setup do
    @tea_picture = tea_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tea_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tea_picture" do
    assert_difference('TeaPicture.count') do
      post :create, tea_picture: { tea_id: @tea_picture.tea_id }
    end

    assert_redirected_to tea_picture_path(assigns(:tea_picture))
  end

  test "should show tea_picture" do
    get :show, id: @tea_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tea_picture
    assert_response :success
  end

  test "should update tea_picture" do
    put :update, id: @tea_picture, tea_picture: { tea_id: @tea_picture.tea_id }
    assert_redirected_to tea_picture_path(assigns(:tea_picture))
  end

  test "should destroy tea_picture" do
    assert_difference('TeaPicture.count', -1) do
      delete :destroy, id: @tea_picture
    end

    assert_redirected_to tea_pictures_path
  end
end
