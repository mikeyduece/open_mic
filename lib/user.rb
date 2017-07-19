require 'csv'
require './lib/joke'

class User

  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.jokes << joke
  end

  def perform_routine_for(user)
    jokes.map {|joke| user.jokes << joke}
  end

  def learn_routine(routine)
    CSV.foreach routine, headers: true, header_converters: :symbol do |row|
      jokes << Joke.new(row)
    end
  end
end
