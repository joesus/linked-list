require 'minitest/autorun'
require_relative 'hash'

class HashTest < MiniTest::Unit::TestCase

  def setup
    @hash = LLHash.new
    @hash["name"] = "Joe"
    @meal = LLHash.new("appetizer", "bacon-stuff", "salad", "waldorf", "entree", "steak", "side", "potatoes", "dessert", "cakes")
  end

  def test_default_value
    assert_equal nil, @hash["default"]
  end

  def test_to_s
    assert_equal "{name: 'Joe'}", @hash.to_s
  end

  def test_to_s_works_with_full_hash
    assert_equal "{entree: 'steak', salad: 'waldorf', dessert: 'cakes', appetizer: 'bacon-stuff', side: 'potatoes'}", @meal.to_s
  end

  def test_duplicate_hash_keys_are_retrievable
    @hash["asdf"] = "123"
    @hash["asdf3"] = "abc"
    assert_equal "123", @hash["asdf"]
    assert_equal "abc", @hash["asdf3"]
  end

  def test_initializing_with_even_items_works_as_expected
    @sandwich = LLHash.new("bread", "wheat", "meat", "turkey", "condiment", "mustard")
    assert_equal "turkey", @sandwich["meat"]
    assert_equal "wheat", @sandwich["bread"]
    assert_equal "{bread: 'wheat', condiment: 'mustard', meat: 'turkey'}", @sandwich.to_s
  end

  def test_initializing_with_odd_values_defaults_last_value_to_nil
    @sandwich = LLHash.new("bread", "wheat", "meat", "turkey", "mustard")
    assert_equal "{mustard: 'nil', bread: 'wheat', meat: 'turkey'}", @sandwich.to_s
  end
end