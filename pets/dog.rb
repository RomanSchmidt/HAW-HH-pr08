require('./pets/pet')
require('./pets/person')

class Dog < Pet
  public_class_method(:new)

  def initialize(name, birthday, owner)
    super(name, birthday)
    raise(ArgumentError, 'owner is not a Person')unless owner.is_a? Person
    @owner =  owner
    owner.add_pet?(self)
  end
end