require("minitest/autorun")
require("minitest/rg")
require_relative("../category")



class TestCategory < MiniTest::Test

  def setup
    @category = Category.new({
      'name' => 'Body Care',
      'id' => 1
      })
  end

  def test_name()
    assert_equal("Body Care", @category.name)
  end


end
