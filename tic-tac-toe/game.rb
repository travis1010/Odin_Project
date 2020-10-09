require_relative 'player.rb'
require_relative 'board.rb'

class Game
  attr_reader :players
  
  def initialize
    @players = [Player.new("PLAYER X", "X"), Player.new("PLAYER O", "O")]
    @board = Board.new
  end

  def run
    current_player = 0
    game_over = false
    winner = ''
    until game_over
      print "#{@players[current_player].name}, enter your move: "
      x, y = gets.chomp.split
      @board.mark_board(x.to_i, y.to_i, @players[current_player].mark)
      @board.print_board
      if @board.stale_mate?
        game_over = true
        winner = 'Nobody'
      elsif @board.game_won?(@players[current_player])
        game_over = true
        winner = @players[current_player].name
      end
      current_player = (current_player + 1) % 2
    end
    puts "#{winner} wins!"
  end

end

game = Game.new
game.run
