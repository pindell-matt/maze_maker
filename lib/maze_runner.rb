require_relative ('maze')

class MazeRunner

  def initialize
    puts "Please submit the size of your maze ('Q' to quit, 'S' to solve a maze)!"
  end

end

if __FILE__ == $0
MazeRunner.new
end
