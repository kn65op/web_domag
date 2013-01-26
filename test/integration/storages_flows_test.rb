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
    visit "/pl/storages"

    click_link("Dodaj nowy")
    page.has_content?("Dodaj nowy schowek")

    fill_in("Nazwa", :with => new_storage)
    fill_in("Opis", :with => new_description)

    click_button("Utwórz schowek")

    page.has_content?("Dodano schowek")
    page.has_content?(new_storage)

    click_link(new_storage)

    page.has_content?(new_description)
    click_link("Edytuj")

    new_storage = "QWEWQRWQ"
    new_description = " WQEdsaem 23k54!DWF qwe"

    fill_in("Nazwa", :with => new_storage)
    fill_in("Opis", :with => new_description)

    click_button("Edytuj schowek")

    page.has_content?("Edycja zakończona powodzeniem")
    page.has_content?(new_description)

    click_link("Usuń schowek")

    click_link("Tak")

    assert current_path == storages_pl_path, "Wrong redirected"

    page.has_content?("Usunięto schowek")
    page.has_no_content?(new_storage)

  end

 #adding user permissions will be add later
  test "Add storage, add permission to view to other user, check if user can view" do
    new_storage = "Nowy schowek"
    new_description = "Nowy opis"

    https!
    login_as(users(:one))

    visit "/pl/storage/new"
    page.has_content?("Dodaj nowy schowek")

    page.has_content?(storages(:good_nested).name)

    fill_in("Nazwa", :with => new_storage)
    fill_in("Opis", :with => new_description)

    page.select(users(:two).email, :id=> "storage_user_ids")

    click_button("Utwórz schowek")

    click_link(new_storage)

    page.has_content?(new_storage)
    page.has_content?(new_description)

    logout

    login_as(users(:two))
    visit "/pl/storages"
    page.has_content?(new_storage)

    click_link(new_storage)

    assert current_path != storages_pl_path, "Was redirected"
    page.has_content?(new_description)
  end

#    current_path.should == user_settings()
#    assert_equal "en", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

end
