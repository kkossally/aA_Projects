class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    (@head.next == @tail) && (@tail.prev == @head)
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end 
    nil
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    old_prev = @tail.prev
    @tail.prev = new_node
    old_prev.next = new_node
    new_node.next = @tail
    new_node.prev = old_prev
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        break
      end
    end
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        break
      end
    end
  end

  def each(&prc)
    node = first 
    until node.next == nil # try while node.next
      prc.call(node)
      node = node.next      
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
