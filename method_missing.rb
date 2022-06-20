# the concept of writing code that writes code.
# method_missing gives us a way of interacting with objects / attributes that don't necessarily need
# to be defined right away.

# def method_missing(name, *args, &block)
#   puts name, args, block
#   # call rubys default handler
#   # super
# end

# hello do end

hello_world


class User
  attr_reader :attributes

  def initialize
    @attributes = {}
  end

  def method_missing(name, *args, &block)
    # reason we are able to do this is because
    # user.email = "x" is actually user.email=("x")
    if name.end_with?("=")
      @attributes[name.to_s[0..-2].to_sym] = args.first
    else
      @attributes[name]
    end
  end
end

# user = User.new
# p user.email
# user.email = "test@test.com"
# p user.email
