# we can pass a block to any method and if we call yield within that
# method it will execute the code block.

# we can assign yield to a variable and it will give us the result of the yield call

# we can use the ruby method .block_given? to check if a block was provided to the method

# you can't call puts on code with a block because puts will wrap the method call
# puts(link_to("blah")) { "in the block" } => Error
# we can assign it to a variable and then print it though
# link = link_to("blah") { "in the block" }
# puts link

# Using &block we can pass the block around to other methods if needed,
# using the yield option we can only execute the block inside the method
# the block was given to.

def div(content)
  "<div>#{content}</div>"
end

def link_to(title, url=nil)
  if block_given?
    url = title
    title = yield
  end

  "<a href=\"#{url}\">#{title}</a>"
end

title = div("GoRails")
puts link_to(title, "https://gorails.com")

link = link_to "gorails.com" do
  div "GoRails"
end
p link

def calculate(x, y, &block)
  p block.call(x, y)
end

calculate(2,3) do |x, y|
  x * y
end
