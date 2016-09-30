require 'minitest/autorun'
require_relative '../lib/maze'

class MazeTest < Minitest::Test
  attr_reader :maze

  def setup
    @maze = Maze.new(10)
  end

  def test_maze_has_fixed_size
    desired_size = 10
    maze = Maze.new(desired_size)

    assert_equal desired_size, maze.size
  end

  def test_maze_can_generate_a_grid_of_nested_arrays
    grid = @maze.generate_grid(10)

    assert_equal 10, grid.length
    assert_equal 10, grid[0].length
  end
end
