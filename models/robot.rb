# frozen_string_literal: true

class Robot
  ORIENTATIONS = %w[NORTH EAST SOUTH WEST]
  MAX_X_POSITION = 5
  MAX_Y_POSITION = 5

  attr_accessor :x_position, :y_position, :orientation

  def initialize(x_position, y_position, orientation)
    @x_position = x_position
    @y_position = y_position
    @orientation = orientation
  end

  def move
    case orientation
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

  def rotate(direction)
    orientation_index = ORIENTATIONS.find_index(orientation)

    new_orientation_index = if direction == 'LEFT'
                            orientation_index - 1
                          elsif direction == 'RIGHT'
                            orientation_index + 1
                          else
                            orientation_index
                          end

    new_orientation_index = 0 if new_orientation_index >= ORIENTATIONS.length

    new_orientation_index = ORIENTATIONS.length - 1 if new_orientation_index < 0

    self.orientation = ORIENTATIONS[new_orientation_index]
  end

  def report
    "#{x_position}, #{y_position}, #{orientation}"
  end
end
