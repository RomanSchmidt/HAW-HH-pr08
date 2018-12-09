require('test/unit')
require('./pets/dog')

# Author: Roman Schmidt, Daniel Osterholz
class DogTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @dog_name = 'Wauzi'
    @dog_birth_day = Date.parse('2017-01-01')
    @person1_name = 'Owner1'
    @person2_name = 'Stranger1'
    @owner = Person.new(@person1_name)
    @dog = Dog.new(@dog_name, @dog_birth_day, @owner)
    @stranger = Person.new(@person2_name)
  end

  def test_lives
    assert_equal(1, @dog.lives)
  end

  def test_kill_dog
    assert_true(@dog.die?)
  end

  def test_stroke
    assert_true(@dog.stroke?(@owner))
    assert_true(@dog.stroke?(@stranger))
  end

  def test_food
    assert_true(@dog.feed?(@owner))
    assert_true(@dog.feed?(@stranger))
  end
end