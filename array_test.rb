require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'linked_list'
require_relative 'array'

class ArrayTest < MiniTest::Unit::TestCase

  def setup
    @array = LLArray.new("first link")
    @empty_array = LLArray.new
  end

  def test_adding_to_empty_array
    @empty_array[0] = @link1
    assert_equal @empty_array[0], @link1
  end

  def test_adding_to_existing_array
    @array[1] = "second link"
    assert_equal @array[1], "second link"
  end

  def test_get_first_position_of_array
    assert_equal @array[0], "first link"
  end

  def test_get_second_position_of_array
    @array[1] = "second link"
    assert_equal @array[1], "second link"
  end

  def test_array_size_works
    @array[1] = "test link"
    assert_equal @array.size, 2
  end

  def test_shovels_work
    @array << "second link"
    assert_equal @array.size, 2
    assert_equal @array[1], "second link"
  end

  def test_to_string_works_with_two_items
    @array << "second link"
    assert_equal "['first link','second link']", @array.to_s
  end

  def test_to_string_works_with_three_items
    @array << "second link"
    @array << "third link"
    assert_equal "['first link','second link','third link']", @array.to_s
  end

  def test_adding_two_arrays
    @array << "second link"
    @array << "third link"
    @empty_array << "fourth link"
    @empty_array << "fifth link"
    @new_array = @array + @empty_array
    assert_equal @new_array.to_s, "['first link','second link','third link','fourth link','fifth link']"
  end
end