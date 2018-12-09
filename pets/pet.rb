require 'date'

# Author: Roman Schmidt, Daniel Osterholz
class Pet
  private_class_method(:new)

  attr_reader(:lives)

  def initialize(name, birthday)
    raise(ArgumentError, 'name is not a string or its empty') unless (name.is_a?(String) && name.strip.size > 0)
    raise(ArgumentError, 'birthday is not instance of Date') unless (birthday.is_a? Date)

    @nae = name.strip
    @birthday = birthday
    @lives = 1
    @alive = true
  end

  def die?(killer = nil)
    @alive = false
    true
  end

  def stroke?(stroker)
    true
  end

  def feed?(feeder)
    true
  end
end