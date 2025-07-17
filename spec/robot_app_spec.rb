require_relative '../robot_app'
require 'stringio'

RSpec.describe RobotApp do
  let(:app) { RobotApp.new }

  before(:each) do
    @original_stdin = $stdin
    @original_stdout = $stdout
  end

  after(:each) do
    $stdin = @original_stdin
    $stdout = @original_stdout
  end

  describe '#run' do
    it 'returns the expected output' do
      input = StringIO.new("PLACE 0,0, NORTH\nMOVE\nREPORT\nEXIT\n")
      $stdin = input

      output = StringIO.new
      $stdout = output

      app.run

      expect(output.string).to include('Output: 0, 1, NORTH')
    end

    it 'returns the expected output for a second sample' do
      input = StringIO.new("PLACE 0,0,NORTH\nLEFT\nREPORT\nEXIT\n")
      $stdin = input

      output = StringIO.new
      $stdout = output

      app.run

      expect(output.string).to include('Output: 0, 0, WEST')
    end

    it 'returns the expected output for a third sample' do
      input = StringIO.new("PLACE 1,2,EAST\nMOVE\nMOVE\nLEFT\nMOVE\nREPORT\nEXIT\n")
      $stdin = input

      output = StringIO.new
      $stdout = output

      app.run

      expect(output.string).to include('Output: 3, 3, NORTH')
    end
  end
end