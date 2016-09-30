class Maze
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def generate_grid(size, val=nil)
    Array.new(size) { Array.new(size, val) }
  end

  def cell_valid?(x, y)
    maze_range = (0...size)
    maze_range.include?(x) && maze_range.include?(y)
  end

end
