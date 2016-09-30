require 'minitest/autorun'
require_relative '../lib/maze'

class MazeTest < Minitest::Test

  def test_maze_has_fixed_size
    desired_size = 10
    maze = Maze.new(desired_size)

    assert_equal desired_size, maze.size
  end
end
