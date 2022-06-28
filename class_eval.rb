# class_eval is going to evalutate some code in the context of the class
# as if you were just defining things within the class explicitly.

# instead of defining eager_load? eager_load! etc explicitly, we define them
# with metaprogramming using class_eval.

# eager_load is defined on the rails Path class.

# there is a class_eval block version and class_eval string version.

# You can use __LINE__ and __FILE__ in metaprogramming to print the correct line and file within 
# a the class_eval multiline string implementation in ruby, otherwise it will start from the first line of the string as line 1.
# This would not be an issue if it were regular ruby code like a block.

class Path
  %w(auto_load eager_load).each do |method|
    class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def #{method}
        # aaaaa
        @#{method} = true
      end

      def skip_#{method}
        @#{method} = false
      end

      def #{method}?
        @#{method}
      end

      def self.test_class_method
        "class method"
      end
    RUBY
  end
end

p Path.new.eager_load
p Path.test_class_method