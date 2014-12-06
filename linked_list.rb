require_relative 'link'

class LinkedList
  attr_accessor :first_link
  alias :next_link :first_link
  alias :next_link= :first_link=

  def initialize(link=nil)
    link.prev_link = self unless link.nil?
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

  def search(content)
    self.first_link.search(content)
  rescue NoMethodError
    nil
  end

  def get(index)
    self.first_link.get(index, 0)
  rescue NoMethodError
    nil
  end

  def get_by_key(key)
    self.first_link.get_by_key(key)
  rescue NoMethodError
    nil
  end

  def insert(link, index)
    self.first_link.insert(link, index)
  rescue NoMethodError
    add(link)
  end

  def each(&block)
    link = first
    while !link.nil?
      yield(link)
      link = link.next_link
    end
    self
  end
end
