require 'csv'

class User
  attr_reader :name

  def initialize(name)
    @name = name
    @jokes = [].flatten
  end

  def jokes
    @jokes
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
      jokes << row
    end
  end
end
