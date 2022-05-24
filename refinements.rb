# One of the arguments against monkey patching is it can be hard to track down errors

# If you override a money patch from something else and you're not returning the same
# object as that other method, you could get weird behavior. For example if you override
# ActiveSupport's 2.hours and return an integer you can't call 2.hours.ago because ago is
# a method on the ActiveSupport::Duration object. This is where refinements come in.

# A refinement is a way of scoping a monkey patch to a single place you want to use it.
# must exist include a module
# It doesn't need to be included globally
# Q: how do you add one to rails if you don't include it globally?

# If we had this refinement in a rails app and used it in our Person class, we would not call
# the ActiveSupport methods that we are refining.

# refinements are the best way to monkey patch. Chris will use it if he needs to backport
# some feature from rails that hasn't been released yet.

module TimeHelpers
  refine Integer do
    def hours
      60 * minutes
    end

    def minutes
      60 * self
    end

    def days
      24 * days
    end
  end
end

class Person
  using TimeHelpers

  def reminder
    p 2.hours
  end
end

