class Board
    attr_accessor :board

    def initialize
        @board = %w[1 2 3 4 5 6 7 8 9] 
    end

    def print_board
        board_string = "\n"
    
        @board.each_with_index do |space, idx|
          if [3, 6].include?(idx)
            board_string += "\n===========\n"
          elsif idx % 3 != 0
            board_string += '|'
          end
          board_string += " #{space} "
        end
    
        puts board_string + "\n"
      end
      
end