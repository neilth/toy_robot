# Toy Robot App

A simulator for a toy robot moving on a tabletop.

## Setup

The following are steps to set up in your local environment:

1. Clone the repository and `cd` into the directory
```
git clone git@github.com:neilth/toy_robot.git
cd toy_robot
```
2. Install the gems
```
bundle install
```
3. (Optional) Run the unit tests
```
bundle exec rspec
```


## How To Use
Run the Ruby console application:
```
ruby robot_app.rb
```

You will then be able to use the following commands:

```
PLACE X,Y,F
```
- Puts the toy robot on the table in position X, Y and facing NORTH, SOUTH, EAST, or WEST.

```
MOVE
```
- Moves the toy robot one unit forward in the direction it is currently facing.
```
LEFT
RIGHT
```
- Rotate the toy robot 90 degrees in the specified direction without changing its position.
```
REPORT
```
- Announce the position X, Y, and orientation of the robot in the format: "Output: <X position>, <Y position>, <Orientation>"
```
EXIT
```
- Exits the application
  - Alternatively, Ctrl + C can also be used to exit the application

## Versions Used
- Ruby v3.4.4
- RSpec v3.8.0
