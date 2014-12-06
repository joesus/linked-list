require 'pry-nav'
require_relative 'linked_list'

class LLHash
  attr_accessor :linked_list, :default

  def initialize(*args)
  	if args.length < 2
  		self.default = args.first
  	end
  	self.linked_list = LinkedList.new
  	args.each_slice(2) do |slice|
  		self.linked_list.add(Link.new(key: slice[0], contents: slice[1]))
  	end
  end

  def [](key)
    self.linked_list.get_by_key(key).contents
  rescue NoMethodError
    self.default
  end

  def []=(key, contents)
    link = Link.new(contents: contents, key: key)
    self.linked_list.add(link)
  end

  def to_s
  	if self.linked_list.first_link.nil?
  		"{}"
  	else
  		string = ""
  		self.linked_list.each do |link|
        string << "#{link.key}: '#{link.contents || 'nil'}', "
      end
      2.times { string.chop! }
      "{#{string}}"
    end
  end
end