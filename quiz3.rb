#!/usr/bin/env ruby

class Coffee
  attr_accessor :size, :blend, :temperature

  def initialize(size, blend="house", temperature="hot")
    @size = size
    @blend = blend
    @temperature = temperature
  end

  def to_s
    "Here's your #{@size}, #{@temperature}, #{@blend} blend coffee."
  end
end

coffee = Coffee.new('large', 'breakfast')

puts coffee
