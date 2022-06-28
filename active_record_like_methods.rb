# To accomplish this we need to know tables, types and columns for the db.

# GET METADATA FROM PG, this can be used to build the schema
# SELECT table_name FROM information_schema.tables WHERE table_type='BASE TABLE' AND table_schema='public';
# SELECT column_name, data_type FROM information_schema.columns WHERE table_name='users';

# Can add class level methods to AR::Base for things like where queries and scopes.
# Can add types similarly to column names to cast those to and from ruby.
# Find and create would also be instance methods.

require 'pg'

module ActiveRecord
  class Base
    def self.table_name
      "#{name.downcase}s"
    end
  
    def self.columns
      @columns ||= connection.exec("SELECT column_name, data_type FROM information_schema.columns WHERE table_name='users';")
    end
  
    def self.connection
      @connection ||= PG.connect(dbname: "woofound")
    end

    def self.inherited(base)
      base.class_eval do
        columns.each do |column|
          name = column["column_name"]
          define_method(name) do
            @attributes[name]
          end

          define_method(:"#{name}=") do |value|
            @attributes[name] = value
          end
        end
      end
    end

    def initialize
      @attributes = {}
    end
  end
end

class User < ActiveRecord::Base
end

u = User.new.title = "jeff"
p u.inspect
