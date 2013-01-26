require 'test_helper'

class ManufacturersFlowsTest < ActionDispatch::IntegrationTest

  include Warden::Test::Helpers

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  teardown do
    Warden.test_reset!
  end

  test "Add, edit, delete new simple manufacturer" do #simple means no parent or co-storagers
    new_manufacturer = "Nowy producent"

    https!
    login_as(users(:one))
    visit "/pl/manufacturers"

    click_link("Dodaj nowego producenta")
    page.has_content?("Dodaj nowego producenta")

    fill_in("Nazwa", :with => new_manufacturer)

    click_button("Utwórz producenta")

    page.has_content?("Dodano producenta")
    page.has_content?(new_manufacturer)

    click_link(new_manufacturer)

    page.has_content?(new_manufacturer)
    click_link("Edytuj")

    new_manufacturer = "QWEWQRWQ"

    fill_in("Nazwa", :with => new_manufacturer)

    click_button("Edytuj producenta")

    page.has_content?("Edycja zakończona powodzeniem")
    page.has_content?(new_manufacturer)

    click_link("Usuń producenta")

    click_link("Tak")

    assert current_path == manufacturers_pl_path, "Wrong redirected"

    page.has_content?("Usunięto producenta")
    page.has_no_content?(new_manufacturer)

  end

#    current_path.should == user_settings()
#    assert_equal "en", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

end
