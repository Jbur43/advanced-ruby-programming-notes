# Monkey patching refers to the ability to change stuff on the fly in ruby
# can't do this below in many other languages. This is how metaprogramming works

# What other languages might have as "primitives", ruby has as objects. This
# includes classes themselves, these are also objects you can call methods on.
# Which again is not the case in other languages where constants are unmodifiable.

class Person
end

person = Person.new

class Person
  def hello
    puts "hello"
  end
end

person.hello

