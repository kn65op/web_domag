require 'test_helper'

class StoragesControllerTest < ActionController::TestCase

  include Devise::TestHelpers
#logged
  test "should get index logged" do
    sign_in users(:one)
    get :index, :locale => :pl
    assert_response :success, "Can't access index with log in"
  end

  test "should get add logged" do
    sign_in users(:one)
    get :add, :locale => :pl
    assert_response :success , "Can't access add with log in"
  end

  test "should not get edit none id" do
    sign_in users(:one)
    get :edit, :locale => :pl
    assert_redirected_to storages_path, "Can access edit logged in without storage id"
    assert_equal "Nie możesz tego zrobić.", flash[:error]
  end

  test "should not get delete none id" do
    sign_in users(:one)
    get :delete, :locale => :pl
    assert_redirected_to storages_path, "Can access delete logged in without storage id"
    assert_equal "Nie możesz tego zrobić.", flash[:error]
  end

  test "should get edit with admin id" do
    sign_in users(:one)
    get :edit, :locale => :pl, :id => storages(:kitchen).id
    assert_response :success , "Can't access edit with owning storage as admin"
  end

  test "should get edit with non admin id" do
    sign_in users(:one)
    get :edit, :locale => :pl, :id => storages(:evil_cupboard).id
    assert_response :success , "Can access edit with not owning storage"
  end

  test "should not get edit with not own id" do
    sign_in users(:one)
    get :edit, :locale => :pl, :id => storages(:good_cupboard).id
    assert_redirected_to storages_path, "Can't access edit with owning storage not as admin"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should get delete with admin id" do
    sign_in users(:one)
    get :delete, :locale => :pl, :id => storages(:kitchen).id
    assert_response :success , "Can't access delete with log in and owning storage as admin"
  end

  test "should get delete with non admin id" do
    sign_in users(:one)
    get :delete, :locale => :pl, :id => storages(:good_cupboard).id
    assert_response :success , "Can't access delete with log in and owning storage not as admin"
  end

  test "should not get delete not own id" do
    sign_in users(:one)
    get :delete, :locale => :pl, :id => storages(:evil_cupboard).id
    assert_redirected_to storages_path, "Can access delete with log in and not owning storage"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

#not logged
  test "should get index" do
    get :index, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access index without log in"
  end

  test "should get add" do
    get :add, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access add without log in"
  end

  test "should get edit" do
    get :edit, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access edit without log in"
  end

  test "should get delete" do
    get :delete, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access delete without log in"
  end

end
