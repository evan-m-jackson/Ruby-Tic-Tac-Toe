class TestPlayerChoice
  def initialize(input: arr, output: ui)
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

  def get_choice_idx(choice)
    num = choice.to_i
    num - 1
  end
end
