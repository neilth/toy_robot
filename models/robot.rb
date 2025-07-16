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
end
