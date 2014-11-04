require_relative 'link'

class LinkedList
	attr_accessor :first_link

	def initialize(link=nil)
		@first_link = link
	end

	def first
		self.first_link
	end

	def add(link)
		self.first_link.add(link)
	end

	def remove(link, list)
		self.first_link.remove(link, self)
	end

	def size(counter=1)
    self.first_link.size(counter)
	end

	def index_of(searched_link, position=0)
    self.first_link.index_of(searched_link, position)
  end

  def get(index, position=0)
    self.first_link.get(index, position)
  end

	private

	def set_pointer_to_next_link
		self.first_link = self.first_link.next_link
	end
end
