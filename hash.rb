require 'pry-nav'
require_relative 'array'

class LLHash
  attr_accessor :llarray, :default

  def initialize(default=nil)
    self.default = default
    self.llarray = LLArray.new
  end

  def [](key)
    self.llarray.linked_list.get_by_key(key).contents
  rescue NoMethodError
    self.default
  end

  def []=(key, contents)
    link = Link.new(contents: contents, key: key)
    self.llarray.linked_list.add(link)
  end

  def to_s
  	if self.llarray.empty?
  		"{}"
  	else
  		string = ""
  		self.llarray.linked_list.each do |link|
        string << "#{link.key}: '#{link.contents}', "
      end
      2.times { string.chop! }
      "{#{string}}"
    end
  end
end