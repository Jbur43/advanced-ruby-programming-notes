# The differences between all the constant references below is what makes building an
# autoloader hard, keeping track of contexts and nesting

# this says lookup Post at the top level (not nested)
# ::Post

# Returns an array used for constant lookups
# p Module.nesting

class Post
end

module Admin
  class Post
    def initialize
      p "here"
    end
  end

  class User
    p Module.nesting

    # First two reference the same thing, post within admin
    p Post
    p Admin::Post

    # This one references the top level post class
    p ::Post
  end
end

Admin::User
# => [Admin::User, Admin]

class Admin::User
  p Module.nesting
  # if there was no post defined at the top level this would error even though post is defined inside
  # the admin module is not a part of the namespace
  p Post
  # direct reference to the post defined in module
  p Admin::Post.new
  # top level reference
  p ::Post

end

Admin::User
# => [Admin::User]
