# The method below will convert any number of arguments to
# it into an array
# Useful if you're building something open ended, like strong
# parameters params.permit(:title, :blah)
def a(*args)
  p args
end
a("sweet", "args", "you", have: :there)

# Double splat operator
# expects a hashes as args
# just like the single splat, its good for optional things
# goodbye is being pulled out from the hash and assigned to
# a local variable
def b(goodbye: nil, **options)
  p goodbye
  p options
end
b(hello: :friend, goodbye: :pal)

def div(content, **options)
  attrs = options.map{ |k, v| "#{k}='#{v}'"}.join(" ")
  "<div #{attrs}>#{content}</div>"
end
p div("hello", class: "text-blue", "data-id": 1)