class Game
    def initialize
        @board = ['0','1','2','3','4','5','6','7','8']
        @pos_arrow = 1
        @WINNING_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]        
    end

    def get_board
        @board
    end

    def get_marker
        if @pos_arrow == 1
            'X'
        else
            'O'
        end
    end

    def change_marker
        @pos_arrow *= -1
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

    def is_space_free choice
        num = choice.to_i
        if choice == @board[num]
            true
        else
            false
        end
    end

    def mark_board choice
        if is_user_input_valid(choice)
            @board[choice.to_i] = get_marker
        end
    end

    def move_confirmation choice
        if !is_user_input_valid(choice)
            puts "Sorry that is not a valid move. Please select an integer between 0 and 8.\n"
        elsif !is_space_free(choice)
            puts "Sorry this space is taken. Please select another."
        else
            puts "Thank you!"
        end
    end

    def game_over
        (0..8).each do |n|
            if @board[n] == n.to_s
                return false
            end
        end
        return true
    end

    def winning_player
        @WINNING_COMBINATIONS.each do |arr|
            if @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]]
                return @board[arr[0]]
            end
        end
        return "No winner"
    end

    def player_wins
        return winning_player != "No winner"
    end

    def cpu_pick
        (0..8).each do |num|
            str = num.to_s
            if @board[num] == str
                mark_board(str)
                break
            end
        end
        change_marker
    end

end



