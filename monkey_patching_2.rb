# ActiveSupport monkey patches a lot of stuff to give us nice utility methods like 2.hours, 3.days

class Integer
  def hours
    60 * minutes
  end

  def minutes
    60 * self
  end

  def days
    24 * hours
  end
end