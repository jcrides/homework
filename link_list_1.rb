#!/usr/bin/env ruby

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

def empty_list(list_node, stack)
  next_node = list_node.next_node
  stack.push(list_node)
  return if next_node.nil?
  empty_list(next_node, stack)
end

def build_list(list_node, stack)
  next_node = stack.pop
  return if next_node.nil?
  list_node.next_node = next_node
  build_list(next_node, stack)
end

def reverse(list_node)
  stack = Stack.new
  empty_list(list_node, stack)

  first_node = stack.pop
  build_list(first_node, stack)
  first_node
end

class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  # Push an item onto the stack
  def push(element)
    if @data.nil?
      element.next_node = nil
      @data = element
    else
      element.next_node = @data
      @data = element
    end
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return it to the user
  def pop
    if @data.nil?
      return nil
    else
      popped = @data
      @data = @data.next_node
      return popped
    end
  end

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(74, node3)

print_values(node4)
puts "-------"
revlist = reverse(node4)
print_values(revlist)
