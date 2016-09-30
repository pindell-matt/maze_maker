class Maze
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def generate_grid(size)
    Array.new(size) { Array.new(size) }
  end

end
