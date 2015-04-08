#!/usr/bin/env ruby

require 'pry'

class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list_node, previous=nil)
  if previous.nil?
    previous = list_node
    list_node = previous.next_node
    previous.next_node = nil
    reverse_list(list_node, previous)
  elsif list_node.next_node.nil?
    list_node.next_node = previous
    return list_node
  else
    next_node = list_node.next_node if list_node != nil
    list_node.next_node = previous if list_node != nil
    previous = list_node
    list_node = next_node
#    binding.pry
    return list_node if next_node.next_node == nil
    reverse_list(next_node, previous) unless list_node.nil?
  end
  puts "returning outside"
  return list_node
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(74, node3)

print_values(node4)
revlist = reverse_list(node4)
print_values(revlist)
