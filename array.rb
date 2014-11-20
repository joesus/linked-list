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
      temp_array.to_s
    end
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
    array.each do |link|
      self << link.contents
    end
    self
  end

  def -(array)
    array.each do |item|
      # check if a link with the contents is present
      if self.include?(item.contents)
        # find and remove the link
        link ||= self.linked_list.first_link
        until link.contents == item.contents
          link = link.next_link
        end
        self.linked_list.remove(link)
      end
    end
    self.to_s
  end

  def clear
    self.each do |link|
      self.linked_list.remove(link)
    end
    self.to_s
  end

  def collect(&block)
    self.each do |link|
      link.contents = yield(link.contents)
    end
    self.to_s
  end

  def include?(content)
    switch = false
    self.each do |link|
      switch = link.contents == content
      break if switch
    end
    switch
  end

  def select(&block)
    new_array = LLArray.new
    self.each do |link|
      if yield(link.contents)
        new_array << link.contents
      end
    end
    new_array.to_s
  end

  def to_s
    string = ""
    self.each do |link|
      string << "'#{link.contents}',"
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
      yield(link)
      link = link.next_link
    end
  end

end