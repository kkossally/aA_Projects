require 'byebug'
class PolyTreeNode
  
  attr_accessor :children 

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def value
    @value
  end

  def parent=(new_parent)
    parent.children.delete(self) unless parent.nil?
    
    new_parent.children << self unless new_parent.nil?

    @parent = new_parent
  end

  def remove_child(child)
    raise "Nota a child" unless self.children.include?(child) 
    child.parent = nil
  end 

  def add_child(child)
    if children.include?(child)
      return
    else
      child.parent = self
    end
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end 
    nil 
  end

  def bfs(target_value)
    queue = []
    queue.push(self)
    until queue.empty?
      current_node = queue.shift
      if current_node.value == target_value
        return current_node
      else
        queue += current_node.children
      end
    end
    nil
  end

  def inspect
    @value.inspect
  end

end

if $PROGRAM_NAME == __FILE__
  a = PolyTreeNode.new('a')
  b = PolyTreeNode.new('b')
  c = PolyTreeNode.new('c')
  # d = PolyTreeNode.new('d')
  # e = PolyTreeNode.new('e')
  # f = PolyTreeNode.new('f')
  # g = PolyTreeNode.new('g')

  # b.parent = a # a:b 
  # c.add_child(a) # { c: a} 
  # b.parent = d # { d: [b] , c: [a] }  

  a.add_child(b)
  a.add_child(c)
  # b.add_child(d)
  # b.add_child(e)
  # c.add_child(f)
  # f.add_child(g)

  p a.dfs("c")
  # puts "a children: #{a.children.map(&:value)}"
  # puts "b children: #{b.children.map(&:value)}"
  # puts "c children: #{c.children.map(&:value)}"
  # puts "d children: #{d.children.map(&:value)}" 
  # puts "e children: #{e.children.map(&:value)}" 
  # puts "f children: #{f.children.map(&:value)}" 
  # puts "g children: #{g.children.map(&:value)}" 
  
end