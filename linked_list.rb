require_relative 'link'

class LinkedList
  attr_accessor :first_link
  alias :next_link :first_link
  alias :next_link= :first_link=

  def initialize(link=nil)
    @first_link = link
  end

  def first
    self.first_link
  end

  def add(link)
    self.first_link.add(link)
  end

  def remove(link)
    self.first_link.remove(link, self)
  end

  def size(counter=1)
    self.first_link.size(counter)
  end

  def index_of(searched_link)
    self.first_link.index_of(searched_link, 0)
  end

  def get(index)
    self.first_link.get(index, 0)
  end
end
