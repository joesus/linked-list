require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'linked_list'

class LinkedListTest < MiniTest::Unit::TestCase

	def setup
		@link1 = Link.new("first link")
		@link2 = Link.new("second link")
		@link3 = Link.new("third link")
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
  	@list.remove(@link2)
  	assert_equal 1, @list.size
  end

  def test_index_of_returns_the_correct_index
  	@list.add(@link2).add(@link3)
  	assert_equal 2, @list.index_of(@link3)
  end
end
