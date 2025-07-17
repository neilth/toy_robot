# frozen_string_literal: true

require './models/robot'

class RobotApp
  def run
    robot = Robot.new

    loop do
      input = gets.chomp

      if input.include?('PLACE')
        values = input.split('PLACE')[1].split(',').map(&:strip)

        robot.place(*values)
      elsif input == 'MOVE'
        robot.move
      elsif input == 'LEFT' || input == 'RIGHT'
        robot.rotate(input)
      elsif input == 'REPORT' && robot.report
        puts "Output: #{robot.report}"
      elsif input == 'EXIT'
        break
      end
    end
  end
end

if __FILE__ == $0
  App.new.run
end
