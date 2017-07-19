require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  attr_reader :joke
  def setup
    @joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
  end
  def test_it_exists
    assert_instance_of Joke, joke
  end

  def test_it_can_tell_joke_id
    assert_equal 1, joke.id
  end

  def test_it_knows_what_the_question_is
    expected = "Why did the strawberry cross the road?"
    assert_equal expected, joke.question
  end

  def test_it_can_answer_the_question
    expected = "Because his mother was in a jam."
    assert_equal expected, joke.answer
  end
end
