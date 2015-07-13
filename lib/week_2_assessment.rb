# Your code goes here!
Node = Struct.new(:value, :parent, :left_child, :right_child)


class BinarySearchTree
  attr_accessor :root

  def initialize(arg)
    raise ArgumentError unless arg.class == Array
    raise ArgumentError unless arg.all? (Integer)
    
    build_root(arg)
    # build_tree(arg)
  end

  def root
    @root
  end

  def build_root(arr)
    @root=Node.new
    @root.value=arr.shift
    @root.right_child= Node.new(arr.shift, @root, nil, nil)
    until arr[0]<@root.value
      arr.shift
    end
    @root.left_child= Node.new(arr.shift, @root, nil, nil)
  end

  def search(value)
    queue=[]
    queue<<@root

    until queue.empty?

      if queue.right_child.value == value
        puts "Found #{queue.right_child}"
        break
      else
        puts "Found #{queue.left_child}"
        break
      end
      queue << right_child
      queue << left_child
    end

  end
  # def build_tree(arr)
  #   arr=arr[3..-1]
  #   @root=Node.new(arg[0], nil, arg[1], arg[2])
  #   queue=[]
  #   queue<<@root    
  #   while queue.empty? || arr.nil?
  #     t=queue.shift
  #     puts "Level #{t}"
  #     t.left_child
  #     t.right_child
  #   end
  # end
end
puts BinarySearchTree.new([55, 75, 77, 33, 19, 35, 46, 81, 86, 67, 8, 32, 39, 83, 70, 21, 76, 57, 28, 6]).root.left_child.value
