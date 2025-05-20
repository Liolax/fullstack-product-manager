require "test_helper"

class ProductsApiTest < ActionDispatch::IntegrationTest
  test "full product workflow" do
    # Create
    post products_url, params: { product: { name: "API Test", description: "API Desc", price: 9.99 } }, as: :json
    assert_response :success
    product = JSON.parse(response.body)
    id = product["id"]

    # Show
    get product_url(id), as: :json
    assert_response :success
    assert_equal "API Test", JSON.parse(response.body)["name"]

    # Update
    patch product_url(id), params: { product: { price: 19.99 } }, as: :json
    assert_response :success
    # Fix: parse as float for comparison
    assert_in_delta 19.99, JSON.parse(response.body)["price"].to_f, 0.0001

    # Destroy
    delete product_url(id), as: :json
    assert_response :success
  end

  test "should not create invalid product" do
    post products_url, params: { product: { name: "", price: -1 } }, as: :json
    assert_response 422
    body = JSON.parse(response.body)
    assert body["errors"].present?
  end
end
