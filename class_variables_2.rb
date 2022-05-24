# class variables are shared with all subclasses
# This would be good for sharing a database connection across models
# This would not be good for validations, those should occur on their individual models

# To share instance data across child classes, you can use the inherited method below,
# base is the inheriting class

# In the code below applicationrecord class is considered an "abstract class", you don't
# instantiate them through ApplicationRecord.new, you only inherit from them.

class ApplicationRecord
  def self.inherited(base)
    p base
    base.instance_variable_set(:@validations, {})
  end

  def self.validates(name, **options)
    @validations[name] = options
  end

  def self.validations
    @validations
  end
end

class User < ApplicationRecord
  # validates :name, presence: true
end

class Project < ApplicationRecord
end

p ApplicationRecord.validations
p User.validations
p Project.validations
