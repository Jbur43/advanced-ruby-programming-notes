# A block we pass to a function is a closure *Look into

# You can pass as many arguments as you want to yield, it won't error

# When we convert the block to a variable using &block as a method argument, it
# becomes a proc

# yield and block.call do the same thing

# a block is ruby code that can't be assigned to a variable, it can only be attached
# to a function or method call.

# Once we use the ampersand we are converting the block into a proc and saving it
# as the variable we declared in the method argument.

# A block that we pass into a method is basically a proc.
# Other ways of creating procs: Kernel proc method and Proc.new {}.

# DIFFERENCES
# Arguments to procs and blocks are optional. It doesn't care how many arguments are
# passed to it or it exepcts. Given this procs can be said to be more flexible than lambdas
# If you call return from inside Proc.new it will return from the function the Proc was defined
# in. It's not like its own method.
# a do |x|
  # x can be nil
# end

# Arguments to lambdas have required arguments. Expects the same number of arguments.
# Lambdas work like you would expect them to, meaning if you have a certain number
# of expected arguments (often the case) you would want to use a lambda.
# Lambda will return the value to the caller.
# Lambdas work a lot more like a regular method call.
# x can't be nil
# l = ->(x) {x * x}
# p l.call(3)

def a
  b = "chicken"
  d = "link"
  c = yield(b, d, "ddd", "sss")
end

a do |b, d|
  p b
  p d
end
