class Maze
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def generate_grid(size, val=nil)
    Array.new(size) { Array.new(size, val) }
  end

end
