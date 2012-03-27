require 'test_helper'

class ReposControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repo" do
    assert_difference('Repo.count') do
      post :create, :repo => { }
    end

    assert_redirected_to repo_path(assigns(:repo))
  end

  test "should show repo" do
    get :show, :id => repos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => repos(:one).to_param
    assert_response :success
  end

  test "should update repo" do
    put :update, :id => repos(:one).to_param, :repo => { }
    assert_redirected_to repo_path(assigns(:repo))
  end

  test "should destroy repo" do
    assert_difference('Repo.count', -1) do
      delete :destroy, :id => repos(:one).to_param
    end

    assert_redirected_to repos_path
  end
end
