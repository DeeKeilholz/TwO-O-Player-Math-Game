class Question
  attr_accessor :answer, :question


  OPERATOR = %w{+ - * /}


# a question HAS a number1, a number2, an operator
  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operator = OPERATOR.sample
  end


  def question_to_string
    @question ||= "What is #{@num1} #{@operator} #{@num2} ?"
  end


  def right_answer?(userAnswer)
    @answer ||= eval "#{@num1} #{@operator} #{@num2}"
    userAnswer.to_i == @answer
  end

end
