# l keeps access to outer scope
def my_method
  t = 4
  l  = ->(x) {x * x * t}
end

my_method

def my_method
  x = 5
  proctime = Proc.new { |a, b| 3 * x * a * b}
  p proctime.call(3, 5)
end

my_method
