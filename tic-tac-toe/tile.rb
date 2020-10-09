class Tile
  attr_reader :char

  def initialize()
    @char = '_'
  end

  def mark(player_mark)
    @char = player_mark
  end

end