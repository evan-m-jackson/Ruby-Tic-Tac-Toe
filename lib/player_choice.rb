class PlayerChoice
  def initialize(input: $stdin, output: ui)
    @HUMAN = 'X'
    @input = input
    @output = output
  end

  def selection_message
    @output.selection_message
  end

  def get_player_input
    @input.gets.chomp.to_s
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
    choice == board[get_choice_idx(choice)]
  end

  def get_choice_idx(choice)
    num = choice.to_i
    num - 1
  end
end
