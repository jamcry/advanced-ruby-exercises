#spec/enumerable_spec.rb
require 'Enumerable'

RSpec.describe Enumerable do
  describe "#my_each" do
    it "iterates through each element of an array" do
      str = ""
      ["j", "a", "m"].my_each {|letter| str << letter}
      expect(str).to eq("jam")
    end
  end

  describe "#my_each_with_index" do
    it "find the index of a specified element" do
      x = 0
      ["a", "b", "c"].my_each_with_index { |l, i| x = i if l == "a"}
      expect(x).to eq(0)
    end
  end

  describe "#my_select" do
    it "selects positive numbers" do
      expect([1, -5, -6, 2, 41, -46].my_select {|n| n > 0}).to eq([1,2,41])
    end
  end

  describe "#my_all?" do
    it "checks if all elements are negative" do
      expect([-1, -2, -3].my_all? {|n| n < 0}).to eq(true)
    end
  end

  describe "#my_any?" do
    it "checks if there is any even element" do
      expect([1, 3, 5].my_any? { |n| n % 2 == 0 }).to eq(false)
    end
  end

end