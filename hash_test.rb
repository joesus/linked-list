require 'minitest/autorun'
require_relative 'hash'

class HashTest < MiniTest::Unit::TestCase

  def setup
    @hash = LLHash.new
    @hash["first_name"] = "Joe"
    @meal = LLHash.new("appetizer", "bacon-stuff", "salad", "waldorf", "entree", "steak", "side", "potatoes", "dessert", "cakes")
  end

  def test_default_value
    assert_equal nil, @hash["default"]
  end

  def test_to_s
    assert_equal "{first_name: 'Joe'}", @hash.to_s
  end

  def test_to_s_works_with_full_hash
    assert_equal "{appetizer: 'bacon-stuff', dessert: 'cakes', entree: 'steak', salad: 'waldorf', side: 'potatoes'}", @meal.to_s
  end

  def test_to_s_works_with_empty_hash
    @empty_hash = LLHash.new
    assert_equal "{}", @empty_hash.to_s
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
    assert_equal "{bread: 'wheat', meat: 'turkey', mustard: 'nil'}", @sandwich.to_s
  end

  def test_change_value
    @hash["first_name"] = "Ben"
    assert_equal "Ben", @hash["first_name"]
  end

  def test_keys_method
    assert_equal ["appetizer", "dessert", "entree", "salad", "side"], @meal.keys
  end

  def test_values_method
    @meal["other_value"] = ["a standalone array"]
    assert_equal ["[\"a standalone array\"]", "bacon-stuff", "cakes", "potatoes", "steak", "waldorf"], @meal.values
  end

  def test_delete_removes_key_value_pair
    @hash["a"] = 100
    @hash["b"] = 200
    @hash.delete("a")
    assert_equal "{b: '200', first_name: 'Joe'}", @hash.to_s
  end

  def test_size
    assert_equal 5, @meal.size
  end

  def test_eql
    set_one = LLHash.new("one", 1, "two", 2, "three", 3)
    set_two = LLHash.new("one", 1, "two", 2, "three", 3)
    assert_equal true, set_one.eql?(set_two)
  end

  def test_has_key
    assert_equal true, @meal.has_key?("appetizer")
    assert_equal false, @meal.has_key?("shrimp course")
  end

  def test_has_value
    assert_equal true, @meal.has_value?("cakes")
    assert_equal false, @meal.has_value?("celery")
  end
end