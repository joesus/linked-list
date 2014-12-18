require 'pry-nav'
require_relative 'link'
require_relative 'linked_list'

class LLArray
  attr_accessor :linked_list

  def initialize(content = nil)
    self.linked_list = LinkedList.new
    if !content.nil?
      link = Link.new(contents: content)
      self.linked_list.add(link)
    end
  end

  def [](index, length=nil)
    link ||= self.linked_list.get(index)
    if length.nil?
      link.contents
    else
      return nil if self.size < length
      temp_array = LLArray.new
      length.times do
        temp_array << link.contents
        link = link.next_link
      end
      temp_array
    end
  end

  def []=(index, content)
    link = Link.new(contents: content)
    self.linked_list.insert(link, index)
  end

  def <<(content)
    link = Link.new(contents: content)
    self.linked_list.add(link)
  end

  def +(array)
    array.linked_list.each do |link|
      self << link.contents
    end
    self
  end

  def -(array)
    array.linked_list.each do |link|
      self.include?(link.contents)
      link_to_remove = self.linked_list.search(link.contents)
      self.linked_list.remove(link_to_remove)
    end
    self
  end

  def clear
    self.linked_list = nil
    self
  end

  def empty?
    self.linked_list.nil?
  end

  def include?(content)
    !self.linked_list.search(content).nil?
  end

  def select(&block)
    new_array = LLArray.new
    self.linked_list.each do |link|
      if yield(link.contents)
        new_array << link.contents
      end
    end
    new_array.to_s
  end

  def to_s
    if self.empty?
      "[]"
    else
      string = ""
      self.linked_list.each do |link|
        string << "'#{link.contents}',"
      end
      string.chop!
      "[#{string}]"
    end
  end

  def length
    self.linked_list.size
  end
  alias :size :length

  def each(&block)
    link = self.linked_list.first
    while link
      link.contents = yield(link.contents)
      link = link.next_link
    end
    self
  end
end