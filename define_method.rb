# running code at the class level like this is how
# a lot of the rails code is written

# method missing processing is a lot slower than define method

class User
  @@attributes = [:id, :email, :name]

  @@attributes.each do |name|
    define_method(name) do
      @attributes[name]
    end

    define_method(:"#{name}=") do |value|
      @attributes[name] = value
    end
  end

  def initialize
    @attributes = {}
  end
end

u = User.new
u.id = 1
p u.id