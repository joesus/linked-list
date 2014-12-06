require "pry-nav"

class Link
  attr_accessor :next_link, :prev_link, :contents

  def initialize(args)
    @next_link = args[:next_link]
    @prev_link = args[:prev_link]
    @contents  = args[:contents]
    @key       = args[:key]
  end

  def first?
    self.prev_link.class != Link
  end

  def last?
    self.next_link.nil?
  end

  def add(link)
    if self.last?
      self.next_link = link
      link.prev_link = self
    else
      self.next_link.add(link)
    end
  end

  def remove(link)
    if self == link
      self.prev_link.next_link = link.next_link
      link.next_link.prev_link = self.prev_link unless link.next_link.nil?
    else
      self.next_link.remove(link)
    end
  end

  def get(index, position=0)
    if index == position
      self
    else
      self.next_link.get(index, position + 1)
    end
  end

  def search(content)
    if content == self.contents
      self
    else
      self.next_link.search(content)
    end
  end

  def index_of(searched_link, index=0)
    if self == searched_link
      index
    else
      self.next_link.index_of(searched_link, index + 1)
    end
  end

  def size(counter=1)
    if self.last?
      counter
    else
      self.next_link.size(counter+1)
    end
  end

  def insert(link, index, position=0)
    position ||= 0
    if index == position
      link.prev_link = self.prev_link
      self.prev_link.next_link = link
      link.next_link = self
      self.prev_link = link
    elsif index == position + 1
      self.next_link.insert(link, index, position + 1)
    else
      link.next_link = Link.new(contents: self)
      self.next_link.insert(link, index, position + 1)
    end
  end

end
