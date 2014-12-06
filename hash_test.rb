require 'minitest/autorun'
require_relative 'hash'

class HashTest < MiniTest::Unit::TestCase

  def setup
    @hash = LLHash.new
  end

  def test_hash_values_default_to_nil
    assert_equal nil, @hash["anything"]
  end

  def test_can_set_default_value
    @hash = LLHash.new("default")
    assert_equal "default", @hash["anything"]
  end
end