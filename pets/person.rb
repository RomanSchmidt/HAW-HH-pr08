require('./pets/pet')
require('./pets/cat')

# Author: Roman Schmidt, Daniel Osterholz
class Person

  def initialize(name)
    raise(ArgumentError, 'name is not a string') unless (name.is_a?(String) && name.strip.size > 0)
    @pets = Set.new
    @name = name
  end

  def add_pet?(pet)
    raise(ArgumentError, 'pet is not an instance of Pet') unless pet.is_a? Pet
    @pets.add?(pet).nil? ? false : true
  end

  def stroke?(pet)
    return false unless pet.is_a? Cat
    pet.stroke?(self)
  end

  def feed?(pet)
    return false unless pet.is_a? Cat
    pet.feed?(self)
  end
end