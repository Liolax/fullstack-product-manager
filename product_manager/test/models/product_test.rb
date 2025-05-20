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
    product = Product.new(name: "Test Product", description: "Test", price: 10)
    assert_equal true, product.available, "Product.available should default to true"
  end

  test "available should handle boolean and common boolean-like values" do
    # nil assignment (should use default through set_default_available)
    product_nil = Product.new(name: "Test", description: "Desc", price: 1.0)
    product_nil.available = nil
    product_nil.valid?
    assert product_nil.valid?, "Product should be valid when available is set to nil (defaults to true)"
    assert_equal true, product_nil.available, "Product.available should default to true when set to nil"

    # true assignment
    product_true = Product.new(name: "Test", description: "Desc", price: 1.0, available: true)
    assert product_true.valid?
    assert_equal true, product_true.available

    # false assignment
    product_false = Product.new(name: "Test", description: "Desc", price: 1.0, available: false)
    assert product_false.valid?
    assert_equal false, product_false.available

    # type casting for 1
    product_one = Product.new(name: "Test", description: "Desc", price: 1.0, available: 1)
    assert product_one.valid?, "Product should be valid when available is 1 (casts to true)"
    assert_equal true, product_one.available

    # type casting for 0
    product_zero = Product.new(name: "Test", description: "Desc", price: 1.0, available: 0)
    assert product_zero.valid?, "Product should be valid when available is 0 (casts to false)"
    assert_equal false, product_zero.available

    # type casting for "true" string
    product_str_true = Product.new(name: "Test", description: "Desc", price: 1.0, available: "true")
    assert product_str_true.valid?, "Product should be valid when available is 'true' (casts to true)"
    assert_equal true, product_str_true.available

    # type casting for "false" string
    product_str_false = Product.new(name: "Test", description: "Desc", price: 1.0, available: "false")
    assert product_str_false.valid?, "Product should be valid when available is 'false' (casts to false)"
    assert_equal false, product_str_false.available

    # type casting for "on"
    product_on = Product.new(name: "Test", description: "Desc", price: 1.0, available: "on")
    assert product_on.valid?, "Product should be valid when available is 'on' (casts to true)"
    assert_equal true, product_on.available

    # type casting for "off"
    product_off = Product.new(name: "Test", description: "Desc", price: 1.0, available: "off")
    assert product_off.valid?, "Product should be valid when available is 'off' (casts to false)"
    assert_equal false, product_off.available

    # type casting for unrecognized string (should be true, not false)
    product_foo = Product.new(name: "Test", description: "Desc", price: 1.0, available: "foo")
    assert product_foo.valid?, "Product should be valid when available is 'foo' (casts to true)"
    assert_equal true, product_foo.available

    # type casting for empty string (becomes nil, then defaults to true via set_default_available)
    product_empty_str = Product.new(name: "Test", description: "Desc", price: 1.0, available: "")
    product_empty_str.valid?
    assert product_empty_str.valid?, "Product should be valid when available is '' (casts to nil then defaults to true)"
    assert_equal true, product_empty_str.available
  end
end
