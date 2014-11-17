require 'pry-nav'
require_relative 'link'
require_relative 'linked_list'

class LLArray
  attr_accessor :linked_list

  def initialize(content = nil)
    self.linked_list = LinkedList.new
    if !content.nil?
      link = Link.new(content)
      self.linked_list.add(link)
    end
  end

  def [](index)
    self.linked_list.get(index).contents
  end

  def []=(index, content)
    link = Link.new(content)
    self.linked_list.insert(link, index)
  end

  def <<(content)
    link = Link.new(content)
    self.linked_list.add(link)
  end

  def +(array)
    array.each do |content|
      self << content
    end
    self
  end

  def to_s
    string = ""
    self.each do |contents|
      string << "'#{contents}',"
    end
    string.chop!
    "[#{string}]"
  end

  def length
    self.linked_list.size
  end
  alias :size :length

  def each(&block)
    link = self.linked_list.first_link
    while !link.nil?
      yield(link.contents)
      link = link.next_link
    end
  end

end