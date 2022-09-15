class PlayerChoice
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
end