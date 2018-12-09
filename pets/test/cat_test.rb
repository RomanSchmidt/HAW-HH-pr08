require('test/unit')
require('./pets/cat')

# Author: Roman Schmidt, Daniel Osterholz
class CatTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @cat_name = 'Lucifer'
    @cat_birth_day = Date.parse('2017-01-01')
    @cat = Cat.new(@cat_name, @cat_birth_day)

    @person1_name = 'Servant1'
    @person2_name = 'Servant2'
  end

  def test_lives
    assert_equal(9, @cat.lives)
  end

  def test_kill_kitty_self
    9.times do
      assert_false(@cat.die?(@cat))
    end
  end

  def test_kill_kitty_person
    servant = Person.new(@person1_name)
    assert_true(@cat.add_servant?(servant))
    9.times do
      assert_false(@cat.die?(servant))
    end
  end

  def test_kill_kitty_cat
    other_cat = Cat.new('Cat2', @cat_birth_day)

    8.times do
      assert_false(@cat.die?(other_cat))
    end
    assert_true(@cat.die?(other_cat))
  end

  def test_get_strokes
    assert_false(@cat.get_strokes?)
    servant = Person.new(@person1_name)
    assert_true(@cat.add_servant?(servant))
    assert_true(@cat.get_strokes?)
  end

  def test_get_food
    assert_false(@cat.get_food?)
    servant = Person.new(@person1_name)
    assert_true(@cat.add_servant?(servant))
    assert_true(@cat.get_food?)
  end

  def test_stroke
    stranger = Person.new(@person2_name)
    servant = Person.new(@person1_name)
    assert_true(@cat.add_servant?(servant))

    assert_true(@cat.stroke?(servant))
    assert_false(@cat.stroke?(stranger))
  end

  def test_food
    stranger = Person.new(@person2_name)
    servant = Person.new(@person1_name)
    assert_true(@cat.add_servant?(servant))

    assert_true(@cat.feed?(servant))
    assert_false(@cat.feed?(stranger))
  end
end