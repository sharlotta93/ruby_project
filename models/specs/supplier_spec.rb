require("minitest/autorun")
require("minitest/rg")
require_relative("../supplier")

class TestSupplier < MiniTest::Test

  def setup
    @supplier_1 = Supplier.new({
      'id' => 1,
      'name' => 'Lomond',
      'payment_method' => 'cash'
      })
    @supplier_2 = Supplier.new({
      'id' => 2,
      'name' => 'NoPlastic',
      'payment_method' => 'card'
      })
  end

  def test_name()
    assert_equal('Lomond', @supplier_1.name)
  end

  def test_payment_method()
    assert_equal('card', @supplier_2.payment_method)
  end


end
