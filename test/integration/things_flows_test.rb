require 'test_helper'

class ThingsFlowsTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  teardown do
    Warden.test_reset!
  end

  test "Add, edit, delete new simple thing" do #simple means no parent or co-storagers
    new_thing = "Nowa rzecz"
    new_description = "Nowy opis"
    new_unit = "litr"

    https!
    login_as(users(:one))
    visit "/pl/things"

    click_link("Dodaj nową")
    page.has_content?("Dodaj nową rzecz")

    fill_in("Nazwa", :with => new_thing)
    fill_in("Opis", :with => new_description)
    fill_in("Jednostka", :with => new_unit)

    click_button("Utwórz rzecz")

    page.has_content?("Dodano rzecz")
    page.has_content?(new_thing)

    click_link(new_thing)

    page.has_content?(new_description)
    page.has_content?(new_unit)
    click_link("Edytuj")

    new_thing = "QWEWQRWQ"
    new_description = " WQEdsaem 23k54!DWF qwe"
    new_unit = "kilogram"

    fill_in("Nazwa", :with => new_thing)
    fill_in("Opis", :with => new_description)
    fill_in("Jednostka", :with => new_unit)

    click_button("Edytuj rzecz")

    page.has_content?("Edycja zakończona powodzeniem")
    page.has_content?(new_description)
    page.has_content?(new_unit)

    click_link("Usuń rzecz")

    click_link("Tak")

    assert current_path == things_pl_path, "Wrong redirected"

    page.has_content?("Usunięto rzecz")
    page.has_no_content?(new_thing)

  end

end
