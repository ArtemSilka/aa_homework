require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:pavlova) { Dessert.new("cake", 50, chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(pavlova.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(pavlova.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(pavlova.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "fifty", "Artem") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pavlova.add_ingredient("sugar")).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      expect(pavlova.mix!).to eq(pavlova.ingredients.shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(pavlova.eat(5)).to eq(pavlova.quantity)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {pavlova.quantity > pavlova.eat(5)}.to raise_error("Not enough left")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(pavlova.serve).to eq(pavlova.chef)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(pavlova.make_more)
    end
  end
end
