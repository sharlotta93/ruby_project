require("minitest/autorun")
require("minitest/rg")
require_relative("../product")



class TestProduct < MiniTest::Test

  def setup
    @product_1 = Product.new({
      'id' => 1,
      'name' => 'Solid Shampoo',
      'unit' => 30,
      'min_units_required' => 10,
      'buying_cost' => 2,
      'selling_price' => 3.5,
      'description' => 'solid round bar of shampoo',
      'category_id' => 3,
      'supplier_id' => 2,
      })
  end

  def test_name()
    assert_equal('Solid Shampoo', @product_1.name)
  end

  def test_buying_cost()
    assert_equal(2, @product_1.buying_cost)
  end

  def test_stock_level__out_of_stock()
    product = Product.new({
      'name' => 'Solid Shampoo',
      'unit' => 0,
      'min_units_required' => 7,
      })
      result = product.stock_level()
      assert_equal('out of stock', result)
  end

  def test_stock_level__low()
    product = Product.new({
      'name' => 'Solid Shampoo',
      'unit' => 7,
      'min_units_required' => 7,
      })
      result = product.stock_level()
      assert_equal('low', result)
  end

  def test_stock_level__medium()
    product = Product.new({
      'name' => 'Solid Shampoo',
      'unit' => 13,
      'min_units_required' => 7,
      })
      result = product.stock_level()
      assert_equal('medium', result)
  end

  def test_stock_level__high()
    product = Product.new({
      'name' => 'Solid Shampoo',
      'unit' => 25,
      'min_units_required' => 7,
      })
      result = product.stock_level()
      assert_equal('high', result)
  end

end
