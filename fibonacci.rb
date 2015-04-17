#!/usr/bin/env ruby

# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55
# 0, 1, 2, 3, 4, 5, 6,  7,  8,  9
def calc_fib(n)
  return 1 if n == 1 || n == 0
  calc_fib(n - 1) + calc_fib(n - 2)

end

puts calc_fib(100)
