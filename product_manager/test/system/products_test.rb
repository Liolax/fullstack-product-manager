require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "creating, viewing, editing, and deleting a product" do
    visit products_url
    # ...existing code for visiting index...

    click_on "New Product"
    fill_in "Name", with: "Integration Test Product"
    fill_in "Description", with: "Integration test description"
    fill_in "Price", with: 123.45
    check "Available"
    click_on "Create Product"

    assert_text "Product was successfully created"
    assert_text "Integration Test Product"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated Product"
    click_on "Update Product"
    assert_text "Product was successfully updated"
    assert_text "Updated Product"

    click_on "Back"
    accept_confirm do
      click_on "Delete", match: :first
    end
    assert_no_text "Updated Product"
  end
end
