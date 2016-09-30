class Maze
  attr_accessor :visited
  attr_reader :size

  MOVEMENTS = [
    [0, 1],
    [1, 0],
    [0, -1],
    [-1, 0]
  ]

  def initialize(size)
    @size = size
    @visited = generate_grid(size, false)
  end

  def generate_grid(size, val=nil)
    Array.new(size) { Array.new(size, val) }
  end

  def generate_movements(x, y)
    MOVEMENTS.shuffle.map { |mx, my| [x + mx, y + my] }
  end

  def cell_valid?(x, y)
    maze_range = (0...size)
    maze_range.include?(x) && maze_range.include?(y)
  end

end
