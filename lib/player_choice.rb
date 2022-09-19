class PlayerChoice

    def initialize
        @HUMAN = 'X'
    end

    def selection_message
        puts "\nPlease choose a spot on the board between 1-9: \r"
      end
    
      def get_player_input
        selection_message
        gets.chomp.to_s
      end

    def is_user_input_valid(choice)
        if choice !~ /\D/ && choice.length > 0
          num = choice.to_i
          if num <= 9 && num >= 1
            true
          else
            false
          end
        else
          false
        end
      end

    def is_space_free(board, choice)
        num = choice.to_i
        choice == board[num - 1]
    end

    def move_confirmation(board, choice)
        if !is_user_input_valid(choice)
          puts "Sorry that is not a valid move. Please select an integer between 1 and 9.\n"
        elsif !is_space_free(board, choice)
          puts 'Sorry this space is taken. Please select another.'
        else
          puts 'Thank you!'
        end
      end
end