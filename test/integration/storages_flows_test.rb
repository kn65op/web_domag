require 'test_helper'
require 'test_integration_helper'

class StoragesFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Warden::Test::Helpers

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  teardown do
    Warden.test_reset!
  end

  test "Add, edit, delete new simple storage" do #simple means no parent or co-storagers
    new_storage = "Nowy schowek"
    new_description = "Nowy opis"

    https!
    login_as(users(:one))

    visit "/pl/storage/new"
    page.has_content?("Dodaj nowy schowek")

    fill_in("Nazwa", :with => new_storage)
    fill_in("Opis", :with => new_description)

    click_button("Dodaj")

    page.has_content?("Dodano schowek")
    page.has_content?(new_storage)

  end

# adding user permissions will be add later
#  test "Add storage, add permission to view to other user, check if user can view" do
#    new_storage = "Nowy schowek"
#    new_description = "Nowy opis"
#
#    https!
#    login_as(users(:one))
#
#    visit "/pl/storage/new"
#    page.has_content?("Dodaj nowy schowek")
#
#    fill_in("Nazwa", :with => new_storage)
#    fill_in("Opis", :with => new_description)
#  end

#    current_path.should == user_settings()
#    assert_equal "en", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

end
