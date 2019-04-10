require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../food.rb")


class PubTest < MiniTest::Test

  def setup
    @pub = Pub.new("The Ol Git", (0), [@drink1, @drink2, @drink3],[@food1, @food2])
    @drink1 = Drink.new("Tequila", (1), 9)
    @drink2 = Drink.new("Absynthe", (1), 15)
    @drink3 = Drink.new("Guinness", (2), 2)
    @customer1 = Customer.new("Billy-Bob", (100), 17)
    @customer2 = Customer.new("Greg", (5), 24)
    @food1 = Foods.new("pizza", 8, 2)
    @food2 = Foods.new("kebab", 5, 20)

  end

  def test_pubs_name
    assert_equal("The Ol Git", @pub.name)
  end

  def test_pub_gets_paid
    @pub.pub_gets_paid(@drink1)
    assert_equal(1, @pub.till)
  end

  def test_customer_buys_drink
    @customer1.buy_drink(@drink3)
    assert_equal(98, @customer1.wallet)
  end
  # def test_remove_drink
  #   @pub.remove_drink('wine')
  #   assert_equal(2, @pub.drinks.count)
  # end

  def test_check_customers_age
    assert_equal(17, @customer1.age)
  end

  def test_check_if_old_enough__too_young
    result = @pub.check_if_old_enough(@customer1, @drink2)
    assert_equal("Sorry mate.", result)
  end

  def test_check_if_old_enough__old_enough
     @pub.check_if_old_enough(@customer2, @drink1)
    assert_equal(4, @customer2.wallet)
  end

  def test_customer_isnt_too_drunk__is_smashed
    @customer2.buy_drink(@drink1)
    @customer2.buy_drink(@drink2)
    @customer2.buy_drink(@drink2)
    result = @pub.youve_ad_enuff(@customer2, @drink2)
    assert_equal("You've ad enuff, naw feck off", result)
  end

  def test_customer_isnt_too_drunk__isnt_smashed
    @customer2.buy_drink(@drink1)
    result = @pub.youve_ad_enuff(@customer2, @drink2)
    assert_equal("Here you go!", result)
  end

  # def test_check_total_stock
  #   total_stock(@pub.drinks)
  # end




end
