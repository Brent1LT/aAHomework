require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) {Dessert.new("pastry", 10, chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("pastry")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownie", "a lot", "chef")}.to raise_error(ArgumentError)
    end
end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.add_ingredient("eggs")).to include("eggs")
    end
  end

  describe "#mix!" do
    before(:each) do
      cake.add_ingredient("cake mix")
      cake.add_ingredient("water")
      cake.add_ingredient("vegetable oil")
      cake.mix!
    end
    it "shuffles the ingredient array" do
      expect(cake.ingredients).to_not eq(["cake mix", "water", "vegetable oil"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cake.eat(5)).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cake.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef the Great Baker")
      expect(cake.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
