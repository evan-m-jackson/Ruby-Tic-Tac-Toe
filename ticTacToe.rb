class Game

  def initialize
    @pos_arrow = 1
    @CPU = 'O'
  end

  def get_marker
    if @pos_arrow == 1
      @HUMAN
    else
      @CPU
    end
  end

  def change_marker
    @pos_arrow *= -1
  end

  def welcome
    puts 'WELCOME TO TIC TAC TOE!'
  end

end
