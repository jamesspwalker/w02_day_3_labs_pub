class Pub
  attr_reader :name, :drinks, :food
  attr_accessor :till

def initialize(name, till, drinks, foods)
  @name = name
  @till = till
  @drinks = drinks
  @foods = foods

end

  # def remove_drink(drink)
  #   removed_drink = @drinks.delete(drink)
  #   p @drinks
  # end

  def pub_gets_paid(drink)
    @till += drink.price
  end

  def check_if_old_enough(customer, drink)
      if customer.age >= 18
        customer.buy_drink(drink)
        pub_gets_paid(drink)
      else
        p "Sorry mate."
      end
  end

  def youve_ad_enuff(customer, drink)
    if customer.drunkeness <= 25
      customer.buy_drink(drink)
      pub_gets_paid(drink)
      return "Here you go!"
    else
      return "You've ad enuff, naw feck off"
    end
  end

end
