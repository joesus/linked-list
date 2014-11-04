require "pry-nav"

class Link
	attr_accessor :next_link, :contents

	def initialize(contents, next_link=nil)
		@next_link = next_link
		@contents = contents
	end

	def last?
		self.next_link.nil?
	end

	def add(link)
		if self.last?
			self.next_link = link
		else
			self.next_link.add(link)
		end
	end

	def remove(link)
		if self.next_link == link
      if link.last?
        self.next_link = nil
      else
        self.next_link = link.next_link
      end
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

  def index_of(searched_link, index)
    if self == searched_link
      index
    else
      self.next_link.index_of(searched_link, index + 1)
    end
  end

  def size(counter)
    if self.last?
      counter
    else
      self.next_link.size(counter+1)
    end
  end

end
