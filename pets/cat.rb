require('./pets/pet')
require('./pets/person')
require('set')

# Author: Roman Schmidt, Daniel Osterholz
class Cat < Pet
  public_class_method(:new)

  def initialize(name, birthday)
    super(name, birthday)
    @servant = Set.new
    @lives = 9
  end

  def add_servant?(servant)
    raise(ArgumentError, 'servant is not a person') unless servant.is_a?(Person)
    @servant.add?(servant).nil? ? false : true
  end

  def die?(killer)
    return true unless @alive

    if killer.is_a?(Cat) && killer.equal?(self) == false
      @lives -= 1
    end

    @alive = @lives > 0

    !@alive
  end

  def stroke?(stroker)
    @servant.include?(stroker)
  end

  def feed?(feeder)
    @servant.include?(feeder)
  end

  def get_strokes?
    the_chosen_one = @servant.to_a.sample
    the_chosen_one.nil? ? false : the_chosen_one.stroke?(self)
  end

  def get_food?
    the_chosen_one = @servant.to_a.sample
    the_chosen_one.nil? ? false : the_chosen_one.feed?(self)
  end
end