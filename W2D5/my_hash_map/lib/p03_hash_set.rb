class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def hash_key(key)
    key.hash
  end
  
  def insert(key)
    h_key = hash_key(key)

    if include?(key)

    else
      if count + 1 > num_buckets
        resize!
      end

      self[key] << h_key
      @count += 1
      return include?(key)
    end
    false
  end

  def include?(key)
    h_key = hash_key(key)
    self[key].include?(h_key)
  end

  def remove(key)
    h_key = hash_key(key)
    if include?(key)
      self[key].delete(h_key)
      @count -= 1
    end
    include?(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = HashSet.new(num_buckets * 2)
    store.each do |bucket|
      bucket.each do |el|
        new_set.insert(el)
      end
    end
    @store = new_set.store
  end
end
