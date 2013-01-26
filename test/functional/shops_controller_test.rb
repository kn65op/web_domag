require 'test_helper'

class ShopsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

#not logged
  test "should not get index not logged" do
    get :index, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get index not logged"
  end

  test "should not get view not logged" do
    get :view, :id => shops(:one_lidl), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get view not logged"
  end

  test "should get new not logged" do
    get :new, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get new not logged"
  end

  test "should get edit not logged" do
    get :edit, :id => shops(:one_lidl), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get edit not logged"
  end

  test "should get delete not logged" do
    get :delete, :id => shops(:one_lidl), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get delete not logged"
  end

#logged
  test "should get index logged" do
    sign_in users(:one)
    get :index, :locale => :pl
    assert_response :success, "Not get index logged"
  end

  test "should get view logged" do
    sign_in users(:one)
    get :view, :id => shops(:one_lidl), :locale => :pl
    assert_response :success, "Not get view logged"
  end

  test "should get new logged" do
    sign_in users(:one)
    get :new, :locale => :pl
    assert_response :success, "Not get new logged"
  end

  test "should get edit logged" do
    sign_in users(:one)
    get :edit, :id => shops(:one_lidl), :locale => :pl
    assert_response :success, "Not get edit logged"
  end

  test "should get delete logged" do
    sign_in users(:one)
    get :delete, :id => shops(:one_lidl), :locale => :pl
    assert_response :success, "Not get delete logged"
  end

#logged, other user shop
  test "should get view logged other user" do
    sign_in users(:one)
    get :view, :id => shops(:two_lidl), :locale => :pl
    assert_redirected_to shops_pl_path, "Not redirected"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should get edit logged other user" do
    sign_in users(:one)
    get :edit, :id => shops(:two_lidl), :locale => :pl
    assert_redirected_to shops_pl_path, "Not redirected"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should get delete logged other user" do
    sign_in users(:one)
    get :delete, :id => shops(:two_lidl), :locale => :pl
    assert_redirected_to shops_pl_path, "Not redirected"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

end
