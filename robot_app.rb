# frozen_string_literal: true

require './models/robot'

class RobotApp
  def run
    robot = Robot.new

    loop do
      input = gets.chomp.strip

      if input.include?('PLACE')
        values = input.split('PLACE')[1].split(',').map(&:strip)

        robot.place(*values) if values.length == 3
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
  RobotApp.new.run
end
