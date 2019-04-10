require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../drink.rb")

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Tequila", (1), 9)
    @drink2 = Drink.new("Absynthe", (1), 15)
    @drink3 = Drink.new("Guinness", (2), 2)
  end

  def test_drink_price
    assert_equal(1, @drink2.price)
  end

end
