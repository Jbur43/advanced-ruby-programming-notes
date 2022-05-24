# When defining alias and alias method pointers, they will use the class they are defined in, eg:
class User
  def name
    "Jack"
  end

  alias full_name name
  alias_method :full_name, :name
end

class Admin < User
  def name
    "Admin"
  end
end

p Admin.new.full_name


# This again is why you should alias the method by defining it in its class, eg:
class User
  def name
    "Jack"
  end

  def full_name
    name
  end
end

class Admin < User
  def name
    "Admin"
  end
end

p Admin.new.full_name