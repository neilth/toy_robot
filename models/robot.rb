# frozen_string_literal: true

class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST]
  MAX_X_POSITION = 5
  MAX_Y_POSITION = 5

  attr_accessor :x_position, :y_position, :direction

  def initialize(x_position, y_position, direction)
    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  def move
    case direction
    when 'NORTH'
      self.y_position += 1 if y_position < MAX_Y_POSITION
    when 'SOUTH'
      self.y_position -= 1 if y_position > 0
    when 'EAST'
      self.x_position += 1 if x_position < MAX_X_POSITION
    when 'WEST'
      self.x_position -= 1 if x_position > 0
    end
  end
end
