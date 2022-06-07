class ConnectionAdapater
  @@db_url = "./path/to/postgres"
end

class ApplicationRecord < ConnectionAdapater
  def self.inherited(base)
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
  p "USER"
  p validations
  p @@db_url
end

# shares User's validations
class Admin < User
  validates :admin, presence: true
  p "Admin"
  p validations
  p @@db_url
end

