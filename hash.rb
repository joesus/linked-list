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
    get_link_from_key(key).contents
  end

  def delete(key)
    index = hash_key(key)
    self.values_array[index].remove(get_link_from_key(key))
  end

  def keys
    tmp_array = []
    self.each { |key| tmp_array << "#{key}" }
    tmp_array.sort
  end

  def has_key?(key)
    keys.include?(key)
  end

  def values
    tmp_array = []
    self.each { |key, value| tmp_array << "#{value}" }
    tmp_array.sort
  end

  def has_value?(value)
    values.include?(value)
  end

  def to_s
    string = ""
    keys.each do |key|
      string << "#{key}: '#{self[key] || 'nil'}', " rescue nil
    end
    2.times { string.chop! }
    "{#{string}}"
  end

  def size
    keys.size
  end

  def each(&block)
    self.values_array.each do |linked_list|
      linked_list.each do |link|
        yield(link.key, link.contents)
      end
    end
  end

  def eql?(hash)
    switch = true
    self.each do |key|
      switch = false if self[key] != hash[key]
      break if self[key] != hash[key]
    end
    if switch
      hash.each do |key|
        switch = false if self[key] != hash[key]
        break if self[key] != hash[key]
      end
      switch
    end
    switch
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

  def get_link_from_key(key)
    index = hash_key(key)
    if self.values_array[index].size > 0
      link = self.values_array[index].get_by_key(key)
    else
      link = Link.new(key: nil, contents: self.default)
    end
  end
end