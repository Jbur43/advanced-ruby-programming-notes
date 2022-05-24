# class variables are shared with all subclasses
# This would be good for sharing a database connection across models
# This would not be good for validations, those should occur on their individual models

class ApplicationRecord
  @@validations = {}

  def validates(name. **options)
    @@validations[name] = options
  end

  def validations
    @@validations
  end
end

class User < ApplicationRecord
end

class Project < ApplicationRecord
end

p ApplicationRecord.validations
p User.validations
p Project.validations
