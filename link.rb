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
end
