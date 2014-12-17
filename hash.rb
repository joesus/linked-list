require 'digest'
require 'pry-nav'
require_relative 'linked_list'

class LLHash
  attr_accessor :linked_list, :values_array, :default

  def initialize(*args)
    self.values_array = Array.new(10)
    self.values_array.map! { |x| x = LinkedList.new }
    if args.length < 2
      # sets a default value for unrecognized keys
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
    index = hash_key(key)
    if self.values_array[index] && self.values_array[index].size > 1
      self.values_array[index].get_by_key(key).contents
    elsif self.values_array[index].size > 0
      self.values_array[index].first.contents
    else
      self.default
    end
  end

  def keys
    tmp_array = []
    self.each do |link|
      tmp_array << "#{link.key}"
    end
    tmp_array.sort
  end

  def to_s
    if self.values_array.empty?
      "{}"
    else
      string = ""
      self.each do |link|
        string << "#{link.key}: '#{link.contents || 'nil'}', " rescue nil
      end
      2.times { string.chop! }
      "{#{string}}"
    end
  end

  def each(&block)
    self.values_array.each do |linked_list|
      linked_list.each(&block) unless linked_list.size < 1
    end
  end

  private

  def add_pair(key, value)
    link = Link.new(key: key, contents: value)
    index = hash_key(key)
    if self.values_array[index].first.nil?
      self.values_array[index].add(link)
    else
      if self.values_array[index].get_by_key(key).nil?
        self.values_array[index].add(link)
      else
        self.values_array[index].get_by_key(key).contents = value
      end
    end
  end

  def hash_key(key)
    Digest::MD5.hexdigest(key).hex % 10
  end
end