require 'minitest/autorun'
require_relative '../lib/maze'

require 'pp'

class MazeTest < Minitest::Test
  attr_reader :maze, :grid

  def setup
    @def_size = 5
    @maze = Maze.new(@def_size)
    @grid = @maze.generate_grid(@def_size)
  end

  def test_maze_has_fixed_size
    desired_size = 10
    maze = Maze.new(desired_size)

    assert_equal desired_size, maze.size
  end

  def test_maze_can_generate_a_grid_of_nested_arrays
    grid = @maze.generate_grid(8)

    assert_equal 8, grid.length
    assert_equal 8, grid[0].length
  end

  def test_maze_can_generate_a_grid_of_nested_arrays_with_desired_type
    desired_size = @def_size
    grid = @maze.generate_grid(desired_size, 0)

    assert_equal desired_size, grid.length
    assert_equal desired_size, grid[0].length
    assert_equal 0, grid[0][0]
    assert_equal 0, grid[desired_size - 1][desired_size - 1]
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

  def test_can_generate_the_maze
    maze = Maze.new(@def_size)
    visited_positions = maze.visited

    refute visited_positions[0][0]
    refute visited_positions[@def_size - 1][@def_size - 1]

    maze.generate_maze(0, 0)

    assert visited_positions[0][0]
    assert visited_positions[@def_size - 1][@def_size - 1]
  end

  def test_can_print_to_console
    out, err = capture_io do
      @maze.print_to_console
    end

    assert_equal "Generated Maze size: #{@def_size}\n", out
  end
end
