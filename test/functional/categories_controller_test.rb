require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

#not logged
  test "should not get index not logged" do
    get :index, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get index not logged"
  end

  test "should not get view not logged" do
    get :view, :id => categories(:one_drinks), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get view not logged"
  end

  test "should get new" do
    get :new, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get new not logged"
  end

  test "should get edit" do
    get :edit, :id => categories(:one_drinks), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get edit not logged"
  end

  test "should get delete" do
    get :delete, :id => categories(:one_drinks), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get delete not logged"
  end

#logged


end
