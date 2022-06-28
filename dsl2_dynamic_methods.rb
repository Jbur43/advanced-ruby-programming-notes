# def_singleton_method - not used in rails projects, but can be useful if you want to define a reusable configurations and want to define those properties you can use this. 
# Infinitely flexible so people can use it in different ways
# Dynamically creates methods on the instance itself eg, Configuration.new(:foo) would have a method of foo on this one instance
# Store config values in a hash (bc its simple) and access them as methods, because it's more readable / clean / correct.
class Configuration
  def initialize(*attributes)
    @config = {}

    attributes.each do |attribute|
      define_singleton_method attribute do
        @config[attribute]
      end

      define_singleton_method :"#{attribute}=" do |val|
        @config[attribute] = val
      end
    end
  end
end

class Rails
  def self.configure(&block)
    instance_eval(&block)
  end

  def self.config
    @config ||= Configuration.new(:feature, :cache_something)
  end
end

Rails.configure do
  puts "in config"

  config.feature = true
  config.cache_something = false
end

p Rails.config
