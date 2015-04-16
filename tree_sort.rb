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

  def extract_nodes
    sortedarr = []
    3.times do
      if sortedarr.last.nil? || sortedarr.last < @root.payload
        sortedarr << self.find_low(@root, sortedarr.last)
      else
        sortedarr << self.find_high(@root, sortedarr.last)
      end
    end
    sortedarr
  end

  def find_low(node, value)
    puts "sorting low for #{value.inspect}"
    if value.nil?                         # array is empty find lowest value
      until node.left.nil?
        node = node.left
      end
      return node.payload
    else                                  # array has at least 1 value
      until node.left.payload == value
        node = node.left
      end
      if node.left.right                  # is there a higher value, find it
        return find_high(node.left, value)
      else                                # if not return the node
        return node.payload
      end
    end
    puts "low"
  end

  def find_high(node, value)
    puts "sorting high for #{value}"
    node = node.right
    return node.payload if node.right.nil? && node.left.nil?
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
sarr = tree.extract_nodes
puts sarr.inspect

puts tree.size
#tree.find_node(tree.root, 10)
