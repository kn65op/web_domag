require 'test_helper'

class StoragesControllerTest < ActionController::TestCase

  include Devise::TestHelpers
#logged
  #index
  test "should get index logged" do
    sign_in users(:one)
    get :index, :locale => :pl
    assert_response :success, "Can't access index with log in"
  end

  #add
  test "should get add logged" do
    sign_in users(:one)
    get :new, :locale => :pl
    assert_response :success , "Can't access add with log in"
  end

#edit - various id
  test "should get edit with admin id" do
    sign_in users(:one)
    get :edit, :id => storages(:kitchen).id, :locale => :pl
    assert_response :success , "Can't access edit with owning storage as admin"
  end

  test "should get edit with non admin id" do
    sign_in users(:one)
    get :edit, :id => storages(:evil_cupboard).id, :locale => :pl
    assert_redirected_to storages_path , "Can access edit with not owning storage"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should not get edit with not own id" do
    sign_in users(:one)
    get :edit, :id => storages(:good_cupboard).id, :locale => :pl
    assert_redirected_to storages_path, "Can access edit with owning storage not as admin"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

#delete - various id
  test "should get delete with admin id" do
    sign_in users(:one)
    get :delete, :id => storages(:kitchen).id, :locale => :pl
    assert_response :success , "Can't access delete with log in and owning storage as admin"
  end

  test "should not get delete with non admin id" do
    sign_in users(:one)
    get :delete, :id => storages(:good_cupboard).id, :locale => :pl
    assert_redirected_to storages_path , "Can access delete with log in and owning storage not as admin"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should not get delete not own id" do
    sign_in users(:one)
    get :delete, :id => storages(:evil_cupboard).id, :locale => :pl
    assert_redirected_to storages_path, "Can access delete with log in and not owning storage"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

#delete - various id
  test "should get confirmed_delete with admin id" do
    sign_in users(:one)
    get :confirmed_delete, :id => storages(:kitchen).id, :locale => :pl
    assert_redirected_to storages_path, "Not redirected to storages index"
    assert_equal "Usunięto schowek", flash[:notice]
  end

  test "should not get confirmed_delete with non admin id" do
    sign_in users(:one)
    get :confirmed_delete, :id => storages(:good_cupboard).id, :locale => :pl
    assert_redirected_to storages_path , "Can access delete with log in and owning storage not as admin"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should not get confirmed_delete not own id" do
    sign_in users(:one)
    get :confirmed_delete, :id => storages(:evil_cupboard).id, :locale => :pl
    assert_redirected_to storages_path, "Can access delete with log in and not owning storage"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

#view - various id

  test "should get view with admin id" do
    sign_in users(:one)
    get :view, :id => storages(:kitchen).id, :locale => :pl
    assert_response :success , "Can't access edit with owning storage as admin"
  end

  test "should get view with non admin id" do
    sign_in users(:one)
    get :view, :id => storages(:good_cupboard).id, :locale => :pl
    assert_response :success , "Can't access delete with log in and owning storage not as admin"
  end

  test "should not get view with non own id" do
    sign_in users(:one)
    get :view, :locale => :pl, :id => storages(:evil_cupboard).id, :locale => :pl
    assert_redirected_to storages_path , "Can access edit with not owning storage"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

#not logged
  test "should not get index not logged" do
    get :index, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access index without log in"
  end

  test "should not get add not logged" do
    get :new, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access add without log in"
  end

  test "should not get view not logged" do
    get :view, :id => storages(:evil_cupboard), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access index without log in"
  end

  test "should not get edit not logged" do
    get :edit, :id => storages(:evil_cupboard),:locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access edit without log in"
  end

  test "should get delete" do
    get :delete, :id => storages(:evil_cupboard), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can access delete without log in"
  end

end
