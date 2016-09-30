class Maze
  attr_accessor :visited, :vertical_walls, :horizontal_walls
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
    @vertical_walls = generate_grid(size, true)
    @horizontal_walls = generate_grid(size, true)
  end

  def generate_grid(size, val=nil)
    Array.new(size) { Array.new(size, val) }
  end

  def generate_movements(x, y)
    MOVEMENTS.shuffle.map { |mx, my| [x + mx, y + my] }
  end

  def generate_maze(x, y)
    visited[x][y] = true
    for mx, my in generate_movements(x, y)
      next if !cell_valid?(mx, my)
      remove_walls(x, y, mx, my)
      generate_maze(mx, my)
    end
  end

  def cell_valid?(x, y)
    maze_range = (0...size)
    maze_range.include?(x) && maze_range.include?(y) && (not visited[x][y])
  end

  def remove_walls(x, y, mx, my)
    min_x, min_y = [ [x, mx].min, [y, my].min ]
    horizontal_walls[x][min_y] = false if x == mx
    vertical_walls[min_x][y] = false if y == my
  end

  def print_to_console
    puts "Generated Maze size: #{size}"
  end

end
