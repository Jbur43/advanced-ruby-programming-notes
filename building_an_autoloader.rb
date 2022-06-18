# Reopen object class
# It has a method we can define called const_missing we can use
# If a constant isn't availble in any of the files on $LOAD_PATH
class Object
  def self.const_missing(name)
    # We cache the lookups in case the constant is referenced many times
    @looked_for ||= {}
    str_name = name.to_s
    p name
    raise "Class not found: #{name}" if @looked_for[str_name]
    @looked_for[str_name] = true
    # Require only returns true, which is why we need const_get
    # this is also why our last implementation didn't work well enough,
    # the object class is the one that defines const_get
    file = "./concerns/#{name.to_s.downcase}"
    require file
    klass = const_get(name)
    # this handles the case of the file being availble but the constant referenced isn't defined
    return klass if klass
    raise "Class not found: #{name}"
  end
end

p Authentication