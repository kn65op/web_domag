require 'test_helper'

class SettingsFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "Login and go to settings page with specified lang" do
    https!
    get "/en"
    assert_response :success, "Can't access main page"

    post_via_redirect "/", :username => users(:one).email, :password => "123123"
    assert_equal "/en", path, "Not logged correctly"

    get "/en/user/settings"
    assert_response :success, "Can't access settings page"
  end

  test "Not login with wrong password with specified lang" do
    https!
    get "/en"
    assert_response :success, "Can't acces main page"

    post_via_redirect "/", :username => users(:one).email, :password => "321321"

    get "/en/user/settings"
    assert_redirected_to "/en/users/sign_in", "Can access settings page"
    #TODO: Add flash notice
  end

  test "Not login with wrong email with specified lang" do
    https!
    get "/en"
    assert_response :success, "Can't access main page"

    post_via_redirect "/", :username => "no_mail@example.com", :password => "321321"

    get "/en/user/settings"
    assert_redirected_to "/en/users/sign_in", "Can access settings page"
    #TODO: Add flash notice
  end
end
