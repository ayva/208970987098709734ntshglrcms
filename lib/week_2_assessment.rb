# Your code goes here!
Node = Struct.new(:value, :parent, :left_child, :right_child)


class BinarySearchTree
  attr_accessor :root, :tree

  def initialize(arg)
    raise ArgumentError unless arg.class == Array
    raise ArgumentError if arg.all?{|argum| !argum.is_a?(Integer)}
    
    @root=Node.new(arg[0])
    @count=1
    build_tree(arg)
    
  end


 
  def find_node_with_value(value, root=@root)
    current_node = root
    return current_node if value == current_node.value
    
      if value > current_node.value && !current_node.right_child.nil?
        find_node_with_value(value,current_node.right_child) 
      elsif !current_node.left_child.nil?
        find_node_with_value(value,current_node.left_child) 
      else
        return nil
      end
        
    
  end

  def build_tree(arr)
    
    return @root if arr.length < 2

    arr=arr[1..-1]
    
    until arr.empty?
      new_value=arr.shift
      build_child(new_value, @root)
      @count+=1
    end
  end

  def build_child(value, root)
    current_node = root
    if value > current_node.value
      if current_node.right_child.nil?
        current_node.right_child = Node.new(value, current_node)
      else
        build_child(value, current_node.right_child)
      end
    else 
      if current_node.left_child.nil?
        current_node.left_child = Node.new(value, current_node)
      else
        build_child(value, current_node.left_child)
      end
    end
  end

  def sorted_array
    queue=[@root]
    array=[]
    until queue.empty?
      current=queue.shift
      array<<current.value
      queue<<current.right_child unless current.right_child.nil?
      queue<<current.left_child unless current.left_child.nil?
    end
    array.sort
  end


  def min
    sorted_array[0]
  end


  def max
    sorted_array[-1]
  end

  def count
    @count
  end
end


#arr = [55, 75, 77, 33, 19, 35, 46, 81, 86, 67, 8, 32, 39, 83, 70, 21, 76, 57, 28, 6]

#puts BinarySearchTree.new([55, 75, 77, 33, 19, 35, 46, 81, 86, 67, 8, 32, 39, 83, 70, 21, 76, 57, 28, 6]).find_node_with_value(46).class

p BinarySearchTree.new([55, 75, 77, 33, 19, 35, 46, 81, 86, 67, 8, 32, 39, 83, 70, 21, 76, 57, 28, 6]).max

