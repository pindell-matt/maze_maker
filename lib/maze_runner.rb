require_relative ('maze')

class MazeRunner
  attr_accessor :maze

  def initialize
    puts "Please submit the size of your maze ('Q' to quit, 'S' to solve a maze)!"
    loop do
      repl_start(user_input)
    end
  end

  def user_input
    print "> "
    input = gets.chomp.upcase
    abort if input[0] == 'Q'
    solve_maze if input[0] == 'S'
    input
  end

  def repl_start(input)
    parse_user_input(input)
  end

  def parse_user_input(input)
    if input.to_i != 0
      new_maze(input)
      puts "Submit 'S' to solve, or a new integer for a new maze"
    else
      puts "Please submit an integer!"
    end
  end

  def new_maze(input)
    @maze = Maze.new(input.to_i)
    maze.generate_maze(0, 0)
    maze.print_to_console
  end

  def solve_maze
    if maze
      maze.solve
      maze.print_to_console
    else
      puts "You need to create a maze first!"
    end
  end

end

if __FILE__ == $0
MazeRunner.new
end
