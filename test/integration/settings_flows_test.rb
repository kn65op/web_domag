require 'test_helper'
require 'test_integration_helper'

class SettingsFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Warden::Test::Helpers

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test "Login and go to settings page with specified lang" do
    https!
    get "/en"
    assert_response :success, "Can't access main page"

    login_as(users(:one), :scope => :user)

    get "/en/user/settings"
    assert_response :success, "Can't access settings page"

    Warden.test_reset!
  end

  test "Not login with wrong password with specified lang" do
    https!
    get "/en"
    assert_response :success, "Can't access main page"

    post_via_redirect "/", :email => users(:one).email, :password => "321321"

    get "/en/user/settings"
    assert_redirected_to "/en/users/sign_in", "Can access settings page"
    #TODO: Add flash notice
  end

  test "test Warden" do
    https!
    get "/en"
    assert_response :success, "Can't access main page"

    login_as(users(:one))

    get "/en/user/settings"
    assert_response :success, "Can't access settings page"

    logout();

    get "/en/user/settings"
    assert_redirected_to "/en/users/sign_in", "Can access settings page"
  end

  test "Change language" do
    https!
    login_as(users(:one))

#    get "/en/user/settings"
    visit "/en/user/settings"

    page.has_content?("Change language")
#    current_path.should == user_settings()
#    assert_equal "/en/user/settings", path, "Not got settings"

    assert_equal "en", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

    #Change lang
 #   find("option[value='pl']").click
    page.select('Polski', :id=> "lang_select")
    click_button('Change')
    page.has_content?("Zmień język")
    assert_equal "pl", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

#    assert_equal "/pl/user/settings", path, "Not changed lang"

    Warden.test_reset!

  end

end
