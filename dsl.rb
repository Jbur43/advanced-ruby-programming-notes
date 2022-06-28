# DSL = A set of terms you're going to use in a specific context.
# DSL examples - HTML / tags, CSS / declarations. 
# They are defined in a consistent way so you know how to reused them all over.
# Our ActiveRecord (where, join, eagerload - abstract away sql), Rspec (minitest has less outside of ruby), Rails.routes, Rails.config are DSL's

# Notice config is not available in the block as `do |config|` it is just available
# that is because rails has changed the context when we call the block below:
# Rails.application.configure do
#   config.cache_classes = false
# end

class Rails
  class Configuration
    def initialize
      @config = {}
    end

    def method_missing(name, args)
      @config[name.to_s.gsub(/=/, "")] = args
    end
  end

  def self.configure(&block)
    instance_eval(&block)
  end

  def self.config
    @config ||= Configuration.new
  end
end

Rails.configure do
  puts "in config"

  config.feature = true
  config.cache_something = false
end

p Rails.config
