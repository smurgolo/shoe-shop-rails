require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get create," do
    get :create,
    assert_response :success
  end

  test "should get new," do
    get :new,
    assert_response :success
  end

  test "should get index," do
    get :index,
    assert_response :success
  end

  test "should get destroy," do
    get :destroy,
    assert_response :success
  end

  test "should get store," do
    get :store,
    assert_response :success
  end

  test "should get listArticles" do
    get :listArticles
    assert_response :success
  end

end
