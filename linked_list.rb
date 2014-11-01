require_relative 'link'

class LinkedList
	attr_accessor :first_link

	def initialize(link)
		@first_link = link
	end

	def first
		self.first_link
	end

	def add(link)
		self.first_link.add(link)
	end

	def remove(link)
		self.first_link.remove(link)
	end

	def size
		@number_of_links ||= 1
		if self.first_link.next_link.nil?
			@number_of_links
		else
			next_link
			@number_of_links += 1
			size
		end
		@number_of_links
	end

	def index_of(searched_link)
		@index ||= 0
		if self.first_link == searched_link
			@index
		else
			next_link
			@index += 1
			index_of(searched_link)
		end
		@index
	end

	private

	def next_link
		self.first_link = self.first_link.next_link
	end
end
