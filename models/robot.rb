# frozen_string_literal: true

class Robot
  ORIENTATIONS = %w[NORTH EAST SOUTH WEST]
  MAX_X_POSITION = 4
  MAX_Y_POSITION = 4

  attr_accessor :x_position, :y_position, :orientation

  def place(x_position, y_position, orientation)
    return unless valid_placement?(x_position, y_position, orientation)

    @x_position = x_position.to_i
    @y_position = y_position.to_i
    @orientation = orientation
  end

  def move
    return if x_position.nil? || y_position.nil? || orientation.nil?

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
    return if orientation.nil?

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
    return if x_position.nil? || y_position.nil? || orientation.nil?

    "#{x_position}, #{y_position}, #{orientation}"
  end

  private

  def valid_placement?(x_position, y_position, orientation)
    x_position.to_s == x_position.to_i.to_s && x_position.to_i >= 0 && x_position.to_i <= MAX_X_POSITION &&
    y_position.to_s == y_position.to_i.to_s && y_position.to_i >= 0 && y_position.to_i <= MAX_Y_POSITION &&
    ORIENTATIONS.include?(orientation)
  end
end
