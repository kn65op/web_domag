#!/bin/env ruby
# encoding: utf-8

require 'test_helper'

class ThingsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

#not logged
  test "should not get index not logged" do
    get :index, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get index not logged"
  end

  test "should not get view not logged" do
    get :view, :id => things(:one_beer), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get view not logged"
  end

  test "should get new not logged" do
    get :new, :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get new not logged"
  end

  test "should get edit not logged" do
    get :edit, :id => things(:one_beer), :locale => :pl
    assert_redirected_to new_user_session_pl_path, "Can get edit not logged"
  end

  test "should get delete not logged" do
    get :delete, :id => things(:one_beer), :locale => :pl
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
    get :view, :id => things(:one_beer), :locale => :pl
    assert_response :success, "Not get view logged"
  end

  test "should get new logged" do
    sign_in users(:one)
    get :new, :locale => :pl
    assert_response :success, "Not get new logged"
  end

  test "should get edit logged" do
    sign_in users(:one)
    get :edit, :id => things(:one_beer), :locale => :pl
    assert_response :success, "Not get edit logged"
  end

  test "should get delete logged" do
    sign_in users(:one)
    get :delete, :id => things(:one_beer), :locale => :pl
    assert_response :success, "Not get delete logged"
  end

#logged, other user category
  test "should get view logged other user" do
    sign_in users(:one)
    get :view, :id => things(:two_beer), :locale => :pl
    assert_redirected_to things_pl_path, "Not redirected"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should get edit logged other user" do
    sign_in users(:one)
    get :edit, :id => things(:two_beer), :locale => :pl
    assert_redirected_to things_pl_path, "Not redirected"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

  test "should get delete logged other user" do
    sign_in users(:one)
    get :delete, :id => things(:two_beer), :locale => :pl
    assert_redirected_to things_pl_path, "Not redirected"
    assert_equal "Nie masz praw dostępu do tej strony.", flash[:error]
  end

end
