#!/usr/bin/env ruby

class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(item)
        @queue.push(item)
    end

    def dequeue
        @queue.shift
    end

    def empty?
      @queue.empty?
    end
end

def find_value(trunk, search_value)
  queue = Queue.new
  trunk.children.each do |child|
    return child if child.payload == search_value
    queue.enqueue(child) unless child.children.empty?
  end
  until queue.empty?
    queue.dequeue.children.each do |child|
      return child if child.payload == search_value
      queue.enqueue(child) unless child.children.empty?
    end
  end
end

# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

puts find_value(trunk, 11).payload
