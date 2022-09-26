class TestPlayerChoice
  def initialize(input: arr, output: output)
    @HUMAN = 'X'
    @input = input
    @output = output
  end

  def selection_message
    @output.selection_message
  end

  def get_player_input
    choice = @input[0]
    @input.shift
    choice
  end

  def is_user_input_valid(choice)
    if choice !~ /\D/ && choice.length > 0
      num = choice.to_i
      num <= 9 && num >= 1
    else
      false
    end
  end

  def is_space_free(board, choice)
    num = choice.to_i
    choice == board[num - 1]
  end

  def move_confirmation_message(board, choice)
    if !is_user_input_valid(choice)
      @output.sorry_invalid
    elsif !is_space_free(board, choice)
      @output.sorry_taken
    else
      puts 'Thank you!'
    end
  end
end
