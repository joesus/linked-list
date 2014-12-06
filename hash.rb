require 'pry-nav'
require_relative 'linked_list'

class LLHash
  attr_accessor :linked_list, :default

  def initialize(default=nil, *args)
    self.default = default
    self.linked_list = LinkedList.new
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
        string << "#{link.key}: '#{link.contents}', "
      end
      2.times { string.chop! }
      "{#{string}}"
    end
  end
end