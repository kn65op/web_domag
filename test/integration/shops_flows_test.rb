#!/bin/env ruby
# encoding: utf-8

require 'test_helper'

class ShopsFlowsTest < ActionDispatch::IntegrationTest

  include Warden::Test::Helpers

  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  teardown do
    Warden.test_reset!
  end

  test "Add, edit, delete new simple shop" do #simple means no parent or co-storagers
    new_shop = "Nowy sklep"
    new_address = "Nowy address"

    https!
    login_as(users(:one))
    visit "/pl/shops"

    click_link("Dodaj nowy sklep")
    page.has_content?("Dodaj nowy sklep")

    fill_in("Nazwa", :with => new_shop)
    fill_in("Adres", :with => new_address)

    click_button("Utwórz sklep")

    page.has_content?("Dodano sklep")
    page.has_content?(new_shop)

    click_link(new_shop)

    page.has_content?(new_address)
    click_link("Edytuj")

    new_shop = "QWEWQRWQ"
    new_address = " WQEdsaem 23k54!DWF qwe"

    fill_in("Nazwa", :with => new_shop)
    fill_in("Adres", :with => new_address)

    click_button("Edytuj sklep")

    page.has_content?("Edycja zakończona powodzeniem")
    page.has_content?(new_address)

    click_link("Usuń sklep")

    click_link("Tak")

    assert current_path == shops_pl_path, "Wrong redirected"

    page.has_content?("Usunięto sklep")
    page.has_no_content?(new_shop)

  end

#    current_path.should == user_settings()
#    assert_equal "en", find_by_id('lang_select').find('option[selected]').value, "Wrong selected lang"

end
