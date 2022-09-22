class CommandUI do
  def sorry_invalid
    puts "Sorry that is not a valid move. Please select an integer between 1 and 9."
  end

  def sorry_taken
    puts 'Sorry this space is taken. Please select another.'
  end
end
