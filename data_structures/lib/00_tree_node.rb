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
    if !parent.nil?
      parent.children.delete(self)
    end
    
    if !new_parent.nil?
      new_parent.children << self
    end

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

    # unless children.include?(child)
    #   @children << child
    #   child.parent = self
    # end
  end

end

if $PROGRAM_NAME == __FILE__
  a = PolyTreeNode.new('a')
  b = PolyTreeNode.new('b')
  c = PolyTreeNode.new('c')
  d = PolyTreeNode.new('d')
  e = PolyTreeNode.new('e')

  b.parent = a # a:b 
  a.children = c # { a: [b,c]}
  b.parent = d # { d: [b] , a: [c] }   
  b.add_child(e)

  puts "a children: #{a.children.map(&:value)}"
  puts "d children: #{d.children.map(&:value)}" 
  puts "b children: #{b.children.map(&:value)}" 
end