require 'digest'
require 'pry-nav'
require_relative 'linked_list'

class LLHash
  attr_accessor :linked_list, :values_array, :default

  def initialize(*args)
    self.values_array = []
    if args.length < 2
      self.default = args.first
    end
    args.each_slice(2) do |slice|
      add_pair(slice[0], slice[1])
    end
  end

  def []=(key, value)
    add_pair(key, value)
  end

  def [](key)
    index = Digest::MD5.hexdigest(key).hex % 10
    if self.values_array[index] && self.values_array[index].size > 1
      self.values_array[index].get_by_key(key).contents
    elsif self.values_array[index]
      self.values_array[index].first.contents
    else
      self.default
    end
  end

  def to_s
    if self.values_array.empty?
      "{}"
    else
      string = ""
      self.values_array.each do |linked_list|
        unless linked_list.nil?
          linked_list.each do |link|
            string << "#{link.key}: '#{link.contents || 'nil'}', " rescue nil
          end
        end
      end
      2.times { string.chop! }
      "{#{string}}"
    end
  end

  private

  def add_pair(key, value)
    link = Link.new(key: key, contents: value)
    index = Digest::MD5.hexdigest(key).hex % 10
    if self.values_array[index].nil?
      self.values_array[index] = LinkedList.new(link)
    else
      self.values_array[index].add(link)
    end
  end
end