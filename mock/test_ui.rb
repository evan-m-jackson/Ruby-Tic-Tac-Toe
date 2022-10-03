class TestUI
  attr_reader :sorry_taken_called, :sorry_invalid_move, :game_over_win_called, :game_over_draw_called,
              :welcome_message_called, :board_printed, :selection_message_printed

  def sorry_taken
    @sorry_taken_called = true
  end

  def sorry_invalid
    @sorry_invalid_move = true
  end

  def game_over_win(_player)
    @game_over_win_called = true
  end

  def game_over_draw
    @game_over_draw_called = true
  end

  def give_welcome_message
    @welcome_message_called = true
  end

  def selection_message
    @selection_message_printed = true
  end
end
