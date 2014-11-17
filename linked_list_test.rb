require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'linked_list'
require_relative 'array'

class LinkedListTest < MiniTest::Unit::TestCase

  def setup
    @link1 = Link.new("first link")
    @link2 = Link.new("second link")
    @link3 = Link.new("third link")
    @link4 = Link.new("fourth link")
    @link5 = Link.new("fifth link")
    @linked_list = LinkedList.new(@link1)
  end

  def test_first_link_is_first
    assert_equal @linked_list.first_link, @linked_list.first
  end

  def test_size_returns_size
    assert_equal @linked_list.size, 1
  end

  def test_adding_a_link_increases_the_size
    @linked_list.add(@link2)
    assert_equal 2, @linked_list.size
  end

  def test_removing_link_decreases_the_size
    @linked_list.add(@link2)
    @linked_list.remove(@link2)
    assert_equal 1, @linked_list.size
  end

  def test_removing_first_link_decreases_size
    @linked_list.add(@link2)
    @linked_list.remove(@link1)
    assert_equal 1, @linked_list.size
  end

  def test_removing_first_link_changes_first_link
    @linked_list.add(@link2).add(@link3)
    @linked_list.remove(@link1)
    assert_equal @link2, @linked_list.first
  end

  def test_chaining_add
    @linked_list.add(@link2).add(@link3)
    assert_equal 3, @linked_list.size
  end

  def test_index_of_returns_the_correct_index
    @linked_list.add(@link2).add(@link3)
    assert_equal 2, @linked_list.index_of(@link3)
  end

  def test_removing_third_link_works
    @linked_list.add(@link2).add(@link3).add(@link4)
    @linked_list.remove(@link3)
    assert_equal 3, @linked_list.size
  end

  def test_removing_fourth_link_works
    @linked_list.add(@link2).add(@link3).add(@link4).add(@link5)
    @linked_list.remove(@link4)
    assert_equal 4, @linked_list.size
  end
  
  def test_get_index_zero
    assert_equal @link1, @linked_list.get(0)
  end

  def test_get_index
    @linked_list.add(@link2).add(@link3).add(@link4).add(@link5)
    assert_equal @link3, @linked_list.get(2)
  end

  def test_adding_link_sets_previous_link_to_self
    @linked_list.add(@link2)
    assert_equal @link2.prev_link, @linked_list.first_link
  end

  def test_first_method_determines_link_position
    @linked_list.add(@link2)
    assert_equal @link1.first?, true
    assert_equal @link2.first?, false
  end

  def test_insert_link_at_first_position
    @linked_list.add(@link2)
    @linked_list.insert(@link3, 0)
    assert_equal @link3, @linked_list.get(0)
  end

  def test_inserted_link_is_configured_correctly
    @linked_list.add(@link2)
    @linked_list.insert(@link3, 0)
    assert_equal @link3.first?, true
    assert_equal @link3.next_link, @link1
  end

  def test_insert_link_at_third_position
    @linked_list.add(@link2).add(@link3).add(@link4)
    @linked_list.insert(@link5, 2)
    assert_equal @link5, @linked_list.get(2)
    assert_equal @link5.prev_link, @link2
    assert_equal @link5.next_link, @link3
  end
end
