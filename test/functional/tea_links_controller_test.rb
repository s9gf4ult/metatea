require 'test_helper'

class TeaLinksControllerTest < ActionController::TestCase
  setup do
    @tea_link = tea_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tea_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tea_link" do
    assert_difference('TeaLink.count') do
      post :create, tea_link: { link: @tea_link.link, tea_id: @tea_link.tea_id }
    end

    assert_redirected_to tea_link_path(assigns(:tea_link))
  end

  test "should show tea_link" do
    get :show, id: @tea_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tea_link
    assert_response :success
  end

  test "should update tea_link" do
    put :update, id: @tea_link, tea_link: { link: @tea_link.link, tea_id: @tea_link.tea_id }
    assert_redirected_to tea_link_path(assigns(:tea_link))
  end

  test "should destroy tea_link" do
    assert_difference('TeaLink.count', -1) do
      delete :destroy, id: @tea_link
    end

    assert_redirected_to tea_links_path
  end
end
