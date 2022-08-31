require 'rspec/autorun'
require './ticTacToe.rb'

describe '#Game' do

    it 'Has String array (aka the board)' do
        game = Game.new
        expect(game.get_board).to eq(['0','1','2','3','4','5','6','7','8'])
    end

    it 'Prints the welcome Message' do
        game = Game.new
        expect{game.welcome}.to output("WELCOME TO TIC TAC TOE!\n").to_stdout()
    end

    it 'Prints the Tic Tac Toe board' do
        game = Game.new
        expect{game.print_board}.to output(" #{game.get_board[0]} | #{game.get_board[1]} | #{game.get_board[2]} \n===========\n #{game.get_board[3]} | #{game.get_board[4]} | #{game.get_board[5]} \n===========\n #{game.get_board[6]} | #{game.get_board[7]} | #{game.get_board[8]} \n").to_stdout()
    end

    it 'Ask player to make a selection' do
        game = Game.new
        expect{game.selection_message}.to output("Please choose a spot on the board between 0-8: \n").to_stdout()
    end

    # it "Receives the player's input" do
    #     game = Game.new
    #     game.stub(:gets).and_return("1\n")
    #     expect(game.get_player_input).to eq("1")

    # end

    it 'When the user input is valid' do
        game = Game.new
        expect(game.is_user_input_valid('5')).to be true
    end

    it "When the user input is valid Pt 2" do
        game = Game.new
        expect(game.is_user_input_valid('0')).to be true
    end

    it "When the user input is valid Pt 2" do
        game = Game.new
        expect(game.is_user_input_valid('8')).to be true
    end

    it "When the user input isn't valid" do
        game = Game.new
        expect(game.is_user_input_valid('10')).to be false
    end

    it "When the user input isn't valid" do
        game = Game.new
        expect(game.is_user_input_valid('15')).to be false
    end

    it "When the user input isn't an integer" do
        game = Game.new
        expect(game.is_user_input_valid('a')).to be false
    end

    it "When the user input isn't an integer Pt 2" do
        game = Game.new
        expect(game.is_user_input_valid('1.1')).to be false
    end

    it "When the user input isn't an integer Pt 3" do
        game = Game.new
        expect(game.is_user_input_valid('1abc23')).to be false
    end

    it "When the user input isn't an integer Pt 4" do
        game = Game.new
        expect(game.is_user_input_valid(' ')).to be false
    end

    it "When the user input is an Empty String" do
        game = Game.new
        expect(game.is_user_input_valid('')).to be false
    end

    it "Mark the board in the middle" do
        game = Game.new
        game.mark_board('4', 'X')
        expect(game.get_board).to eq (['0','1','2','3','X','5','6','7','8'])
    end

    it "Mark the first spot on the board" do
        game = Game.new
        game.mark_board('0', 'X')
        expect(game.get_board).to eq (['X','1','2','3','4','5','6','7','8'])
    end

    it "Try to mark spot not on the board" do
        game = Game.new
        game.mark_board('9', 'X')
        expect(game.get_board).to eq (['0','1','2','3','4','5','6','7','8'])
    end

end