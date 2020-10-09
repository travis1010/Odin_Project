require_relative 'tile.rb'
require_relative 'player.rb'

class Board
  def initialize()
    @grid = Array.new(3){ Array.new(3) { Tile.new } }
  end

  def print_board
    @grid.each do |row|
      row.each { |tile| print tile.char + " " }
      print "\n"
    end
    print "\n"
  end

  def mark_board(x, y, player_mark)
    raise "INPUT ERROR, INVALID BORD COORDINATES" unless (0..2).member?(x) && (0..2).member?(y)
    @grid[x][y].mark(player_mark)
  end

  def stale_mate?
    @grid.flatten.none? { |tile| tile.char == '_'}
  end

  def game_won?(player)
    @grid.each do |row|
      return true if row.all? {|tile| tile.char == player.mark }
    end

    @grid.transpose.each do |column|
      return true if column.all? {|tile| tile.char == player.mark }
    end

    diagonal_1 = [@grid[0][0], @grid[1][1], @grid[2][2]]
    diagonal_2 = [@grid[0][2], @grid[1][1], @grid[2][0]]
    
    return true if diagonal_1.all? {|tile| tile.char == player.mark}
    return true if diagonal_2.all? {|tile| tile.char == player.mark }
   
    false
  end
end

