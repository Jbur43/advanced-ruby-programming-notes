# aliasing refers to the ability to call slightly different methods but
# get the same behavior, eg: cancelled vs canceled.

# alias is a ruby keyword that can't be overwritten.
# alias is also called with lexical scoping. Can't modify self

# alias_method is a method on the Module class that can be overwritten.
# using alias_method, self can be overwritten
# alias_method is commonly used in a module you want to include in other classes
# because the context of self can change.

# the preferred method of aliasing is just to call the name of the
# already implemented method.
class Subscription
  def canceled?
    false
  end

  def cancelled?
    canceled?
  end
end

# aliasing using ruby syntax
class Subscription
  def canceled?
    false
  end

  alias cancelled? canceled?
end

class Subscription
  def canceled?
    false
  end

  alias_method :cancelled?, :canceled?
end