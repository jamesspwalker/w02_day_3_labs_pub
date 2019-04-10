require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../food.rb")


class TestCustomer < MiniTest::Test

  def setup
    @customer1 = Customer.new("Bobby-Bill", (100), 21)
    @customer2 = Customer.new("Craig", (5), 83)
    @drink1 = Drink.new("Guinness", 2, 2)
    @drink2 = Drink.new("Spicy water", 1, 18)
    @pub = Pub.new("The Ol Git", (0), [@drink1], [@food1, @food2])
    @food1 = Foods.new("pizza", 8, 2)
    @food2 = Foods.new("kebab", 5, 20)

  end

  def test_buy_drink
    @customer1.buy_drink(@drink1)
    assert_equal(98, @customer1.wallet)
  end

  def test_gets_drunk
    @customer1.buy_drink(@drink1)
    @customer1.buy_drink(@drink2)
    assert_equal(20, @customer1.drunkeness)
  end

  def test_customer_buy_food
    @customer1.buy_food(@food1)
    assert_equal(92, @customer1.wallet)
  end

  def test_customer_less_drunk
    @customer1.buy_drink(@drink2)
    @customer1.buy_food(@food1)
    assert_equal(16, @customer1.drunkeness)
  end


    def test_customer_less_drunk_isnt_minus_drunk
      @customer1.buy_drink(@drink2)
      @customer1.buy_food(@food2)
      assert_equal(0, @customer1.drunkeness)
    end


end
