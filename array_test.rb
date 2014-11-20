require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'linked_list'
require_relative 'array'

class ArrayTest < MiniTest::Unit::TestCase

  def setup
    @array = LLArray.new("first link")
    @full_array = LLArray.new("first link")
    @full_array << "second link"
    @full_array << "third link"
    @empty_array = LLArray.new
    @numbers = LLArray.new
    @numbers << 1
    @numbers << 2
    @numbers << 3
    @alphabet = LLArray.new
    @alphabet  << "a"
    @alphabet  << "b"
    @alphabet  << "c"
    @alphabet  << "d"
    @alphabet  << "e"
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
    assert_equal 2, @array.size
    assert_equal "second link", @array[1]
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
    @added_array = LLArray.new("fourth link")
    @added_array << "fifth link"
    @new_array = @full_array + @added_array
    assert_equal @new_array.to_s, "['first link','second link','third link','fourth link','fifth link']"
  end

  def test_select_works_with_one_result
    assert_equal "['first link']", @array.select { |x| x == "first link" }
  end

  def test_select_works_with_multiple_results
    assert_equal "['1','2','3']", @numbers.select { |x| x < 5 }
  end

  def test_include
    assert_equal true, @array.include?("first link")
  end

  def test_include_another_number
    assert_equal true, @numbers.include?(1)
    assert_equal true, @numbers.include?(3)
    assert_equal true, @numbers.include?(2)
  end

  def test_subtracting_arrays
    @more_numbers = LLArray.new
    @more_numbers << 2
    @more_numbers << 3
    assert_equal "['1']", (@numbers - @more_numbers)
  end

  def test_get_length_works_with_valid_length
    assert_equal "['1','2','3']", @numbers[0, 3]
    assert_equal "['2','3']", @numbers[1, 2]
  end

  def test_range_with_invalid_range_returns_nil
    assert_equal nil, @numbers[0, 8]
  end

  def test_clear
    assert_equal "[]", @numbers.clear
  end

  def test_collect
    assert_equal "['a!','b!','c!','d!','e!']", @alphabet.collect { |x| x + "!" }
  end

  def test_collect!
    @alphabet.collect! { |x| x + "!" }
    assert_equal "['a!','b!','c!','d!','e!']", @alphabet.to_s
  end

end