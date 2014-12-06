require 'minitest/autorun'
require_relative 'hash'

class HashTest < MiniTest::Unit::TestCase

  def setup
    @hash = LLHash.new
    @meal = LLHash.new("appetizer", "bacon-stuff", "salad", "waldorf", "entree", "steak", "side", "potatoes", "dessert", "cakes")
    @sandwich = LLHash.new("bread", "wheat", "meat", "turkey", "mustard")
  end

  def test_hash_values_default_to_nil
    assert_equal nil, @hash["anything"]
  end

  def test_can_set_default_value
    @hash = LLHash.new("default")
    assert_equal "default", @hash["anything"]
  end

  def test_to_s_works_with_empty_hash
    assert_equal "{}", @hash.to_s
  end

  def test_to_s_works_with_full_hash
    assert_equal "{appetizer: 'bacon-stuff', salad: 'waldorf', entree: 'steak', side: 'potatoes', dessert: 'cakes'}", @meal.to_s
  end

  def test_setting_hash_with_odd_values_defaults_last_value_to_nil
  	@sandwich = LLHash.new("bread", "wheat", "meat", "turkey", "mustard")
  	assert_equal "{bread: 'wheat', meat: 'turkey', mustard: 'nil'}", @sandwich.to_s
  end
end