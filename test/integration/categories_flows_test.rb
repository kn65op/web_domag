require 'test_helper'
require 'test_integration_helper'

class CategoriesFlowsTest < ActionDispatch::IntegrationTest
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

  test "Add, edit, delete new simple category" do #simple means no parent or co-storagers
    new_category = "Nowa kategoria"
    new_description = "Nowy opis"

    https!
    login_as(users(:one))
    visit "/pl/categories"

    click_link("Dodaj nową")
    page.has_content?("Dodaj nową kategorię")

    fill_in("Nazwa", :with => new_category)
    fill_in("Opis", :with => new_description)

    click_button("Utwórz kategorię")

    page.has_content?("Dodano kategorię")
    page.has_content?(new_category)

    click_link(new_category)

    page.has_content?(new_description)
    click_link("Edytuj")

    new_category = "QWEWQRWQ"
    new_description = " WQEdsaem 23k54!DWF qwe"

    fill_in("Nazwa", :with => new_category)
    fill_in("Opis", :with => new_description)

    click_button("Edytuj kategorię")

    page.has_content?("Edycja zakończona powodzeniem")
    page.has_content?(new_description)

    click_link("Usuń kategorię")

    click_link("Tak")

    assert current_path == categories_pl_path, "Wrong redirected"

    page.has_content?("Usunięto kategorię")
    page.has_no_content?(new_category)

  end

#    current_path.should == user_settings()
#    assert_equal "en", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

end
