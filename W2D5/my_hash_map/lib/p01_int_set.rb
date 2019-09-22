class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    self.include?(num)
    @store[num] = true
    true
  end

  def remove(num)
    self.include?(num)
    @store[num] = false
    true
  end

  def include?(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    end
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if self.include?(num)
      return false
    else
      self[num] << num
      true
    end
  end

  def remove(num)
    raise "Number not in set" unless include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num)
      return false
    elsif count + 1 > num_buckets
      resize!
      self[num] << num
      @count += 1
      true
    else
      self[num] << num
      @count += 1
      true
    end
  end

  def remove(num)
    if !include?(num)
    else
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = ResizingIntSet.new(num_buckets * 2)

    @store.each do |bucket|
      bucket.each do |el|
        new_set.insert(el)
      end
    end

    @store = new_set.store
  end
end
