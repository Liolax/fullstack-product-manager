require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create!(name: "Sample", description: "Sample desc", price: 5.0)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should filter by availability" do
    get products_url(params: { available: true }), as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert body.all? { |p| p["available"] == true }
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should create product with valid data" do
    assert_difference("Product.count") do
      post products_url, params: {
        product: {
          name: "New Product",
          description: "Desc",
          price: 5.0,
          available: true
        }
      }, as: :json
    end
    assert_response :success
  end

  test "should not create product with invalid data" do
    post products_url, params: {
      product: { name: "", description: "", price: -1 }
    }, as: :json
    assert_response 422
    body = JSON.parse(response.body)
    assert body["errors"].present?
  end

  test "should update product with valid data" do
    patch product_url(@product), params: {
      product: { name: "Updated Name" }
    }, as: :json
    assert_response :success
    @product.reload
    assert_equal "Updated Name", @product.name
  end

  test "should not update product with invalid data" do
    patch product_url(@product), params: {
      product: { price: -10 }
    }, as: :json
    assert_response 422
    body = JSON.parse(response.body)
    assert body["errors"].present?
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product), as: :json
    end
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal @product.id, body["id"]
  end
end
