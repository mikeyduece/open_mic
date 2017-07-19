class Joke

  attr_reader :id, :question, :answer
  def initialize(params)
    @id = params[:id]
    @question = params[:question]
    @answer = params[:answer]
  end
end
