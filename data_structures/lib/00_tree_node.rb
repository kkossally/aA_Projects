require 'byebug'
class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(new_parent)
    if !parent.nil?
      self.parent.remove_child(self)
    end

    @parent = new_parent
    
    if !new_parent.nil?
      new_parent.children = self
    end
  end

  def remove_child(child) # removes from parent 
    puts "Removing #{child.value}"
  end 

  def children=(child)
    if !children.include?(child)
      @children << child
    end
  end

end

branch =PolyTreeNode.new(5)
root = PolyTreeNode.new(2)
branch.parent = root # add branch to roots children

root.remove_child(branch)

# other_root = PolyTreeNode.new(3)


# PolyTreeNode.remove_child(root, branch) # root's children will be empty
