require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'linked_list'

class LinkedListTest < MiniTest::Unit::TestCase

	def setup
		@link1 = Link.new("first link")
		@link2 = Link.new("second link")
		@link3 = Link.new("third link")
    @link4 = Link.new("fourth link")
    @link5 = Link.new("fifth link")
		@list = LinkedList.new(@link1)
	end

  def test_first_link_is_first
    assert_equal @list.first_link, @list.first
  end

  def test_size_returns_size
  	assert_equal @list.size, 1
  end

  def test_adding_a_link_increases_the_size
  	@list.add(@link2)
  	assert_equal 2, @list.size
  end

  def test_removing_link_decreases_the_size
    @list.add(@link2)
  	@list.remove(@link2)
  	assert_equal 1, @list.size
  end

  def test_removing_first_link_decreases_size
    @list.add(@link2)
    @list.remove(@link1)
    assert_equal 1, @list.size
  end

  def test_removing_first_link_changes_first_link
    @list.add(@link2).add(@link3)
    @list.remove(@link1)
    assert_equal @link2, @list.first
  end

  def test_chaining_add
    @list.add(@link2).add(@link3)
  	assert_equal 3, @list.size
  end

  def test_index_of_returns_the_correct_index
  	@list.add(@link2).add(@link3)
  	assert_equal 2, @list.index_of(@link3)
  end

  def test_removing_third_link_works
    @list.add(@link2).add(@link3).add(@link4)
    @list.remove(@link3)
    assert_equal 3, @list.size
  end

  def test_removing_fourth_link_works
    @list.add(@link2).add(@link3).add(@link4).add(@link5)
    @list.remove(@link4)
    assert_equal 4, @list.size
  end
  
  def test_get_index_zero
    assert_equal @link1, @list.get(0)
  end

  def test_get_index
    @list.add(@link2).add(@link3).add(@link4).add(@link5)
    assert_equal @link3, @list.get(2)
  end
end
