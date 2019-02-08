require("minitest/autorun")
require("minitest/rg")
require_relative("../product")



class TestProduct < MiniTest::Test

  def setup
    @product_1 = Product.new({
      'id' => 1,
      'name' => 'Solid Shampoo',
      'unit' => 'each',
      'min_units_required' => 10,
      'buying_cost' => 2,
      'selling_price' => 3.5,
      'description' => 'solid round bar of shampoo',
      'type_id' => 3,
      'supplier_id' => 2,
      })
  end

  def test_name()
    assert_equal('Solid Shampoo', @product_1.name)
  end

  def test_buying_cost()
    assert_equal(2, @product_1.buying_cost)
  end



end
