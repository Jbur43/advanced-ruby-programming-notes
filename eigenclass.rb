# Every instance of a class can reopen a class just for itself.
# Its parent will be the object it was created from.

# Using this you can add behavior to just a single class in ruby.

class User
  p self

  def hello
    p "hello"
  end
end

u = User.new

# This is a subclass of the class of the object (User)
class << u
  p self
  def hello
    p "hey"
  end
end

u.hello
User.new.hello


class Profile
  def meta_data
    {
      definition: "A Profile is an aggregate of system wide data for once user account"
    }
  end
end

p = Profile.new

class << p
  p self  
  # p meta_data
  def call_meta_data
    p meta_data
  end
end

# Note that call_meta_data was added to the object after it was instantiated
p.call_meta_data
