module Pizza


  class Pie
    attr_accessor :toppings, :delivery_time
    def initialize(toppings=[Pizza::Topping.new("cheese")])
      @toppings = toppings
      @delivery_time = Time.now + 30 * 60
    end

    def deliver!
      @delivery_time = deliver!
    end

    def late?
      Time.now > @delivery_time
    end
 end

  class Topping
    attr_accessor :name, :vegetarian

    # Instantiate a new topping.
    #
    # name - The String name of the topping.
    #
    # Returns a new Topping object.
    def initialize(name, vegetarian: false)
      @name = name
      @vegetarian = vegetarian
    end
  end
end