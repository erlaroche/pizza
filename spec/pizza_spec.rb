require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'timecop'
require_relative '../pizza'

describe Pizza::Pie do

  before do
    Timecop.freeze(Time.now)
  end
  after do
    Timecop.return
  end

  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza = Pizza::Pie.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end
  end
    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza::Pie.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
  end


    it 'Sets the delivery time' do
      pizza = Pizza::Pie.new

      expect(pizza.delivery_time).to eq(Time.now + 30 * 60)
    end

    it 'Pizza is late after 30 min' do
      pizza = Pizza::Pie.new

      Timecop.travel(1801)

      expect(pizza.late?).to eq(true)

      Timecop.return
    end
end


 

describe Pizza::Topping do
  describe '.initialize' do
    it "sets the name of the toppping" do
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end
  end
      it 'sets whether or not the topping is vegetarian' do
       topping = Pizza::Topping.new 'bell peppers', vegetarian: true

        expect(topping.vegetarian).to eq(true)
  end
end 