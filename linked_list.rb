require_relative 'link'

class LinkedList
  attr_accessor :first_link
  alias :next_link :first_link
  alias :next_link= :first_link=

  def initialize(link=nil)
    # sets the first link's parent link to the linked list
    link.prev_link = self
    @first_link = link
  end

  def first
    self.first_link
  end

  def add(link)
    if self.first_link
      self.first_link.add(link)
    else
      self.first_link = link
    end

  end

  def remove(link)
    self.first_link ? self.first_link.remove(link) : false
  end

  def size
    self.first_link ? self.first_link.size : 0
  end

  def index_of(searched_link)
    self.first_link.index_of(searched_link)
  rescue NoMethodError
    nil
  end

  def get(index)
    self.first_link.get(index, 0)
  rescue NoMethodError
    nil
  end

  def insert(link, index)
    self.first_link.insert(link, index)
  end
end
