require 'test_helper'

class MainPageFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "Redirect to main page with no specified lang" do
    https!
    get "/"
    assert_redirected_to "/en", "Not redirected to English main page"
  end

end
