#!/usr/bin/env ruby

Node = Struct.new(:payload, :left, :right)

class Tree
  attr_accessor :root

  def initialize(root=nil)
    @root = Node.new(root)
    @node_count = 1
  end

  def add_node(value)
    new_node = Node.new(value)
    if @root.payload.nil?
      @root = new_node
      puts "adding #{new_node.payload} to tree"
      return true
    end

    curr_node = @root
    puts "adding #{new_node.payload} to tree"
    assigned = false
    until assigned
      if new_node.payload < curr_node.payload
        if curr_node.left.nil?
          curr_node.left = new_node
          assigned = true
        end
        curr_node = curr_node.left
      else
        if curr_node.right.nil?
          curr_node.right = new_node
          assigned = true
        end
        curr_node = curr_node.right
      end
    end
    @node_count += 1
  end

  def size
    @node_count
  end

  def sort
    Tree.sort(@root)
  end

  def self.sort(node)
    # deal with left side of tree
    if node.nil?
      return []
    end
    sorted_left = sort(node.left)

    # deal with trunk
    trunk = [node.payload]

    # deal with right side of tree
    sorted_right = sort(node.right)

    sorted_left + trunk + sorted_right
  end

  def find_node(node, search_value)
    children = []
    children << node.left unless node.left.nil?
    children << node.right unless node.right.nil?
    if node.payload == search_value
      puts "returning #{node.payload}"
      return node
    end
    children.each do |child|
      puts "finding from child #{child.payload}"
      checked = find_node(child, search_value)
      return checked if checked.payload == search_value
    end
    node
  end

end



nodes = [7, 4, 9, 1, 6, 14, 10]
tree = Tree.new()

nodes.each { |n| tree.add_node(n) }
sarr = tree.sort
puts sarr.inspect

puts tree.size
#tree.find_node(tree.root, 10)
