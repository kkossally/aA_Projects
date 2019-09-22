require 'byebug'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count
  attr_reader :store


  def initialize(num_buckets = 4)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    store.each do |linked_list|
      return true if linked_list.include?(key)
    end
    false
  end

  def set(key, val)
    if include?(key)
      @store[bucket(key)].update(key, val)

    else
      if count + 1 > num_buckets
        resize!
      end
      @store[bucket(key)].append(key, val)
      @count += 1
    end
  end

  def get(key)
    store.each do |bucket|
      bucket.get(key)
    end
  end

  def delete(key)
    if include?(key)
      store.each do |bucket|
        bucket.remove(key)
      end
      @count -= 1
    else
      return false
    end
  end

  def each(&prc)
    store.each do |linked_list|
      linked_list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_set = HashMap.new(num_buckets * 2)

    store.each do |bucket|
      bucket.each do |node|
        new_set.set(node.key, node.val)
      end
    end

    @store = new_set.store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % num_buckets
  end
end
