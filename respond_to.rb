# you can work with any type by asking if the object responds_to


class User
  attr_reader :attributes, :allowed

  def initialize
    @allowed = [:id, :email, :name]
    @attributes = {}
  end

  def method_missing(name, *args, &block)
    # reason we are able to do this is because
    # user.email = "x" is actually user.email=("x")
    if !respond_to_missing?(name)
      super
    elsif name.end_with?("=")
      @attributes[name.to_s[0..-2].to_sym] = args.first
    else
      @attributes[name]
    end
  end

  def respond_to_missing?(name, *)
    allowed.include?(name.to_s.gsub("=", "").to_sym)
  end
end

user = User.new
p user.respond_to?(:email)
p user.respond_to?(:upcase)
p user.email
user.email = "test@test.com"
p user.email

