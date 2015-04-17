#!/usr/bin/env ruby

require 'benchmark'

# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
# 0, 1, 2, 3, 4, 5, 6,  7,  8,  9
def calc_fib_r(n)
  return 1 if n == 1 || n == 0
  calc_fib_r(n - 1) + calc_fib_r(n - 2)
end

def calc_fib_i(n)
  the_fibs = [1, 1]                             # pre seed with 1,1 start of seq
  (n-1).times do |i|                            #
    the_fibs[i+2] = the_fibs[i] + the_fibs[i+1]
  end
  the_fibs.last
end

fib = 30
Benchmark.bm do |x|
  x.report('recursive') { calc_fib_r(fib) }
  x.report('iterative') { calc_fib_i(fib) }
end
