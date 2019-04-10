require("minitest/autorun")
require("minitest/rg")
require_relative("../food.rb")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../drink.rb")

class FoodsTest < MiniTest::Test

  def setup
    @food1 = Foods.new("pizza", 8, 2)
    @food2 = Foods.new("kebab", 5, 20)
  end


end
