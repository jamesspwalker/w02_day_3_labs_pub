class Customer

  attr_accessor :wallet, :drunkeness
  attr_reader :name, :age

  def initialize(name, wallet, age)

    @name = name
    @wallet =wallet
    @age = age
    @drunkeness = 0

  end

  def buy_drink(drink)
      @wallet -= drink.price
      @drunkeness += drink.units
  end

  def buy_food(food)
      @wallet -= food.price
      @drunkeness -= food.rejuvination_level
      if @drunkeness <= 0
        @drunkeness = 0
      end
  end

end
