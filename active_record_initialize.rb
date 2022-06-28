require 'pg'

module ActiveRecord
  class Base
    def self.table_name
      "#{name.downcase}s"
    end
  
    def self.columns
      @columns ||= begin
        results = connection.exec("SELECT column_name, data_type FROM information_schema.columns WHERE table_name='users';").to_a
        Hash[results.map{|hash| [hash["column_name"], hash["data_type"]]}].transform_keys(&:to_sym)
      end
    end
  
    def self.connection
      @connection ||= PG.connect(dbname: "woofound")
    end

    def self.inherited(base)
      base.class_eval do
        columns.keys.each do |name|
          define_method(name) do
            @attributes[name]
          end

          define_method(:"#{name}=") do |value|
            @attributes[name] = value
          end
        end
      end
    end

    def initialize(attributes={})
      @attributes = attributes.slice(*self.class.columns.keys)
    end
  end
end

class User < ActiveRecord::Base
end

# p User.columns.keys
u = User.new
# p u.inspect
u.title = "chief of red bull"
p u
p u.title
u.help = "bla"
