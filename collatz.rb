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

def collatz_recur(num)
  seq = []
  return [] if num == 1

  if num % 2 == 0
    seq += [num / 2]
    return seq += collatz_recur(num / 2)
  else
    seq += [num * 3 + 1]
    return seq += collatz_recur(num * 3 + 1)
  end
end

def calc_seq(n,s=0)
  if n == 1
    return s
  elsif n & 1 == 0
    return calc_seq(n/2,s+1)
  else
    return calc_seq(3*n+1,s+1)
  end
end

max = 10000
Benchmark.bm do |x|
  x.report('if else') { (1..max).each { |i| collatz_if(i) } }
  x.report('trinary') { (1..max).each { |i| collatz_tri(i) } }
  x.report('recursive') { (1..max).each { |i| calc_seq(i) } }
  x.report('recursive') { (1..max).each { |i| collatz_recur(i).unshift(i) } }
end

longest = [0, 0]
# (1..max).each do |num|
#   col_len = collatz_if(num + 1)
#   longest = col_len if col_len[1] > longest[1]
# end

puts longest.inspect
puts collatz_recur(3).unshift(3).inspect
