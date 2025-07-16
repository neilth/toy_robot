require_relative '../.././models/robot'

RSpec.describe Robot do
  let (:robot) { Robot.new(x_position, y_position, direction) }
  let (:x_position) { 1 }
  let (:y_position) { 1 }
  let (:direction) { 'NORTH' }
  
  describe '#initialize' do

    it 'must have an initial position and direction' do
      expect(robot.x_position).to eq(x_position)
      expect(robot.y_position).to eq(y_position)
      expect(robot.direction).to eq(direction)
    end
  end
end
