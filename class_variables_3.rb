# The inherited method gets called implicitly through the use of the < sign eg:
# User < ApplicationRecord.

# When admin inherits from User it almost behaves as if we had redefined inherited
# in the User model, because inherited will be called and our @validations
# variable set

# without calling .dup on the validations variable, the @validations
# instance variable would be overwritten all the time. This is because every time
# we call that instance_variable_set we are basically saying "we already have this
# varialbe in memory, lets just give it to this other class".

class ApplicationRecord
  def self.inherited(base)
    p base
    @validations ||= {}
    base.instance_variable_set(:@validations, @validations.dup)
  end

  def self.validates(name, **options)
    @validations[name] = options
  end

  def self.validations
    @validations
  end
end

class User < ApplicationRecord
  validates :name, presence: true
end

class Admin < User
  validates :admin, presence: true
end

p User.validations
p Admin.validations
