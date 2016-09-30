require 'minitest/autorun'
require_relative '../lib/maze'

class MazeTest < Minitest::Test
  attr_reader :maze, :grid

  def setup
    @maze = Maze.new(10)
    @grid = @maze.generate_grid(10)
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

  def test_maze_can_generate_a_grid_of_nested_arrays_with_desired_type
    grid = @maze.generate_grid(10, 0)

    assert_equal 10, grid.length
    assert_equal 10, grid[0].length
    assert_equal 0, grid[0][0]
    assert_equal 0, grid[9][9]
  end

  def test_cells_can_be_valid
    first_cell = @maze.cell_valid?(0, 0)
    last_cell  = @maze.cell_valid?(@maze.size - 1, @maze.size - 1)

    assert first_cell
    assert last_cell
  end

  def test_can_generate_movements_from_a_given_cell
    all_movements = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    movements = @maze.generate_movements(0, 0)

    assert_equal all_movements.sort, movements.sort
  end
end
