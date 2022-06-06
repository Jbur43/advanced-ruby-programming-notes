# Every :symbol has a method of to_proc with &method_name on the proc/
# You can take a proc or lambda and use it as a block for a method.

# One of the main takeaways is that things like symbols are still objects
# that we can alter if needed and the & called with a method name as an argument
# will expand to a proc

# Rough implementation:
# The to_proc is called once and a block is returned. In the block
# that gets called for each item in the array we pass the args and send the method
# to the object
class Symbol
  def to_proc
    p "called"
    ->(obj, args=nil) { obj.send(self, *args) }
  end
end
p ["a", "b", "c"].map(&:upcase)

class Formula
  def self.to_proc
    ->(obj) {obj * obj}
  end
end
[2,4,1].map(&Formula)


# Array arguments:
def a(x, y, z)
  p x, y, z
end

a(*[4, 8, 3])

def b(x)
  p x
end

b([5, 2, 5])


# The & is really calling to proc and then passing to block of the map method.
def a(&block)
  p block
end

a do
end

