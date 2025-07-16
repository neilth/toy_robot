require_relative '../.././models/robot'

RSpec.describe Robot do
  let (:robot) { Robot.new }
  let (:x_position) { '3' }
  let (:y_position) { '3' }
  let (:orientation) { 'NORTH' }
  
  before { robot.place(x_position, y_position, orientation) }

  describe '#place' do
    it 'must set the robot position and orientation' do
      expect(robot.x_position).to eq(x_position.to_i)
      expect(robot.y_position).to eq(y_position.to_i)
      expect(robot.orientation).to eq(orientation)
    end

    context 'when the x position value is invalid' do
      let (:invalid_x_position) { Robot::MAX_X_POSITION + 1 }

      it 'must not update the robot x position' do
        robot.place(invalid_x_position, y_position, orientation)

        expect(robot.x_position).to eq(x_position.to_i)
      end
    end

    context 'when the y position value is invalid' do
      let (:invalid_y_position) { Robot::MAX_Y_POSITION + 1 }

      it 'must not update the robot x position' do
        robot.place(x_position, invalid_y_position, orientation)

        expect(robot.y_position).to eq(y_position.to_i)
      end
    end

    context 'when the orientation value is invalid' do
      let (:invalid_orientation) { 'INVALID' }

      it 'must not update the robot x position' do
        robot.place(x_position, y_position, invalid_orientation)

        expect(robot.orientation).to eq(orientation)
      end
    end
  end

  describe '#move' do
    before { robot.move }

    context 'when the orientation is NORTH' do
      it 'must increase the y position by 1' do
        expect(robot.y_position).to eq(y_position.to_i + 1)
      end

      context 'when the current y position is at the maximum position' do
        let (:y_position) { Robot::MAX_Y_POSITION }

        it 'must not change the y position' do
          expect(robot.y_position).to eq(y_position)
        end
      end
    end

    context 'when the orientation is SOUTH' do
      let (:orientation) { 'SOUTH' }

      it 'must decrease the y position by 1' do
        expect(robot.y_position).to eq(y_position.to_i - 1)
      end

      context 'when the current y position is at 0' do
        let (:y_position) { 0 }

        it 'must not change the y position' do
          expect(robot.y_position).to eq(y_position)
        end
      end
    end

    context 'when the orientation is EAST' do
      let (:orientation) { 'EAST' }

      it 'must increase the x position by 1' do
        expect(robot.x_position).to eq(x_position.to_i + 1)
      end

      context 'when the current x position is at the maximum position' do
        let (:x_position) { Robot::MAX_X_POSITION }

        it 'must not change the x position' do
          expect(robot.x_position).to eq(x_position)
        end
      end
    end

    context 'when the orientation is WEST' do
      let (:orientation) { 'WEST' }

      it 'must decrease the x position by 1' do
        expect(robot.x_position).to eq(x_position.to_i - 1)
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
    context 'when the rotation direction is RIGHT' do
      before { robot.rotate('RIGHT') }
      it 'changes orientation to the right' do
        expect(robot.orientation).to eq('EAST')
      end
    end

    context 'when the rotation direction is LEFT' do
      before { robot.rotate('LEFT') }
      it 'changes orientation to the left' do
        expect(robot.orientation).to eq('WEST')
      end
    end

    context 'when the rotation direction is invalid' do
      before { robot.rotate('INVALID') }
      it 'does not change orientation' do
        expect(robot.orientation).to eq(orientation)
      end
    end
  end

  describe '#report' do
    it 'returns the current position and orientation of the robot' do
      expect(robot.report).to eq('3, 3, NORTH')
    end
  end
end
