class Game
    def initialize
        @board = ['0','1','2','3','4','5','6','7','8']        
    end

    def get_board
        @board
    end

    def welcome
        puts "WELCOME TO TIC TAC TOE!"
    end
    
    def print_board
        board_string = ""

        @board.each_with_index do |space, idx|
            if idx == 3 || idx == 6
                board_string += "\n===========\n"
            elsif idx % 3 != 0
                board_string += "|"
            end
            board_string += " #{space} " 
        end    
        
        puts board_string
    end

    def selection_message
        puts "Please choose a spot on the board between 0-8: \n"
    end

    def get_player_input
        selection_message
        input = gets.chomp.to_s
        input
    end

    def is_user_input_valid choice
        if choice !~ /\D/ && choice.length > 0
            num = choice.to_i
            if num <= 8 && num >= 0
                true
            else
                false   
            end 
        else
            false
        end
    end

    def mark_board (spot, player)
        if is_user_input_valid(spot)
            @board[spot.to_i] = player
        end
    end
end