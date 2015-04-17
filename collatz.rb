#!/usr/bin/env ruby

require 'benchmark'

def collatz_if(num)
  return [1, 1] if num == 1
  calc = num
  iters = 1
  until calc == 1
    if calc % 2 == 0
      calc = calc / 2
    else
      calc = calc * 3 + 1
    end
    iters += 1
  end
  [num, iters]
end

def collatz_tri(num)
  return [1, 1] if num == 1
  calc = num
  iters = 1
  until calc == 1
    calc = calc % 2 == 0 ? calc = calc / 2 : calc = calc * 3 + 1
    iters += 1
  end
  [num, iters]
end

max = 1000000
Benchmark.bm do |x|
  x.report('if else') { (1..max).each { |i| collatz_if(i) } }
  x.report('trinary') { (1..max).each { |i| collatz_tri(i) } }
end

longest = [0, 0]
(1..max).each do |num|
  col_len = collatz_if(num + 1)
  longest = col_len if col_len[1] > longest[1]
end

puts longest.inspect
