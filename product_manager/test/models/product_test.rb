require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.new(
      name: "Test Product",
      description: "A product for testing.",
      price: 10.0
    )
  end

  test "valid product" do
    product = Product.new(name: "Test", description: "Desc", price: 1.0, available: true)
    assert product.valid?
  end

  test "should be valid with valid attributes" do
    assert @product.valid?
  end

  test "should require name" do
    @product.name = nil
    assert_not @product.valid?
    assert_includes @product.errors[:name], "can't be blank"
  end

  test "invalid without name" do
    product = Product.new(description: "Desc", price: 1.0, available: true)
    assert_not product.valid?
  end

  test "should require description" do
    @product.description = nil
    assert_not @product.valid?
    assert_includes @product.errors[:description], "can't be blank"
  end

  test "invalid without description" do
    product = Product.new(name: "Test", price: 1.0, available: true)
    assert_not product.valid?
  end

  test "should require price" do
    @product.price = nil
    assert_not @product.valid?
    assert_includes @product.errors[:price], "can't be blank"
  end

  test "price should be numeric" do
    @product.price = "abc"
    assert_not @product.valid?
    assert_includes @product.errors[:price], "is not a number"
  end

  test "price should be non-negative" do
    @product.price = -5
    assert_not @product.valid?
    assert_includes @product.errors[:price], "must be greater than or equal to 0"
  end

  test "invalid with negative price" do
    product = Product.new(name: "Test", description: "Desc", price: -1, available: true)
    assert_not product.valid?
  end

  test "available should default to true" do
    product = Product.new(name: "Test", description: "Desc", price: 1.0)
    assert product.available
  end

  test "available should only accept boolean values" do
    @product.available = nil
    assert @product.valid?, "Product should be valid when available is nil (defaults to true)"
    @product.available = true
    assert @product.valid?
    @product.available = false
    assert @product.valid?
    @product.available = 1
    assert_not @product.valid?
    @product.available = 0
    assert_not @product.valid?
    @product.available = "true"
    assert_not @product.valid?
    @product.available = "false"
    assert_not @product.valid?
  end
end
