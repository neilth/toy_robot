require_relative '../.././models/robot'

RSpec.describe Robot do
  let (:robot) { Robot.new(x_position, y_position, direction) }
  let (:x_position) { 3 }
  let (:y_position) { 3 }
  let (:direction) { 'NORTH' }
  
  describe '#initialize' do
    it 'must have an initial position and direction' do
      expect(robot.x_position).to eq(x_position)
      expect(robot.y_position).to eq(y_position)
      expect(robot.direction).to eq(direction)
    end
  end

  describe '#move' do
    before { robot.move }

    context 'when the direction is NORTH' do
      it 'must increase the y position by 1' do
        expect(robot.y_position).to eq(y_position + 1)
      end

      context 'when the current y position is at the maximum position' do
        let (:y_position) { Robot::MAX_Y_POSITION }

        it 'must not change the y position' do
          expect(robot.y_position).to eq(y_position)
        end
      end
    end

    context 'when the direction is SOUTH' do
      let (:direction) { 'SOUTH' }

      it 'must decrease the y position by 1' do
        expect(robot.y_position).to eq(y_position - 1)
      end

      context 'when the current y position is at 0' do
        let (:y_position) { 0 }

        it 'must not change the y position' do
          expect(robot.y_position).to eq(y_position)
        end
      end
    end

    context 'when the direction is EAST' do
      let (:direction) { 'EAST' }

      it 'must increase the x position by 1' do
        expect(robot.x_position).to eq(x_position + 1)
      end

      context 'when the current x position is at the maximum position' do
        let (:x_position) { Robot::MAX_X_POSITION }

        it 'must not change the x position' do
          expect(robot.x_position).to eq(x_position)
        end
      end
    end

    context 'when the direction is WEST' do
      let (:direction) { 'WEST' }

      it 'must decrease the x position by 1' do
        expect(robot.x_position).to eq(x_position - 1)
      end

      context 'when the current x position is at 0' do
        let (:x_position) { 0 }

        it 'must not change the x position' do
          expect(robot.x_position).to eq(x_position)
        end
      end
    end
  end

  describe '#rotate' do
    context 'when the rotation orientation is RIGHT' do
      before { robot.rotate('RIGHT') }
      it 'changes direction to the right' do
        expect(robot.direction).to eq('EAST')
      end
    end

    context 'when the rotation orientation is LEFT' do
      before { robot.rotate('LEFT') }
      it 'changes direction to the left' do
        expect(robot.direction).to eq('WEST')
      end
    end

    context 'when the rotation orientation is invalid' do
      before { robot.rotate('INVALID') }
      it 'does not change direction' do
        expect(robot.direction).to eq(direction)
      end
    end
  end

  describe '#report' do
    it 'returns the current position and direction of the robot' do
      expect(robot.report).to eq("3, 3, NORTH")
    end
  end
end
