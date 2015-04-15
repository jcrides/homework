#!/usr/bin/env ruby

Node = Struct.new(:payload, :left, :right)

class Tree
  attr_accessor :root

  def initialize(root=nil)
    @root = Node.new(root)
  end

  def add_node(node)
    new_node = Node.new(node)
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
        curr_node = curr_node.left unless curr_node.left.nil?
        curr_node.left = new_node
        assigned = true
      else
        curr_node = curr_node.right unless curr_node.right.nil?
        curr_node.right = new_node
        assigned = true
      end
    end
  end

  def extract_nodes
    sortedarr = []
    if sortedarr.last < @root.payload
      self.sort_low(@root, sortedarr.last)
    elsif @root.left.nil? && @root.right.nil? # last node
      sortedarr << @root.payload
      @root.payload = nil
    else
      sortedarr << pop_lowest(@root)
      puts "must pull off nodes"
    end
    sortedarr
  end

  private

  def sort_low(node)
    if node.left.nil? && node.right.nil?
      return node.payload

    puts "low"
  end

  def pop_high(node)
    puts "high"
  end

end

nodes = [7, 4, 9, 1, 6, 14, 10]
tree = Tree.new()

nodes.each { |n| tree.add_node(n) }
sarr = tree.extract_nodes
