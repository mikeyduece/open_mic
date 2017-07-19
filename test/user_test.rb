require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'

class UserTest < Minitest::Test

  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_user_can_know_jokes
    sal = User.new("Sal")

    assert_equal 0, sal.jokes.length
    assert_instance_of Array, sal.jokes
  end

  def test_user_can_learn_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)
    assert_equal 1, sal.jokes.length
    assert_instance_of Joke, sal.jokes[0]
  end

  def test_user_can_tell_jokes
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    ali = User.new("Ali")
    sal.learn(joke)
    sal.tell(ali, joke)
    assert_equal 1, ali.jokes.count
    assert_instance_of Joke, ali.jokes[0]
  end

  def test_other_users_can_learn_jokes
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
# => #<Joke:0x007fc87b135240 ...>
  end
end
