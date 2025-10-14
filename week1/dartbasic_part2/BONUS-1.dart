enum Direction { north, east, south, west }
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  //Test Case through instruction

  // int x = 0;
  // int y = 0;
  // Direction direction = Direction.east;
  // const instructions = "LAAARALA";

  // int x = 2;
  // int y = 5;
  // Direction direction = Direction.south;
  // const instructions = "RRAAAAALA";

  // int x = 5;
  // int y = 5;
  // Direction direction = Direction.west;
  // const instructions = "AAAA";

  // int x = 3;
  // int y = 3;
  // Direction direction = Direction.north;
  // const instructions = "AAAA";



  // Process the instructions and get the final position and direction
  
  final result = OperationFunc(x, y, direction, instructions);

  // Print the final position and direction
  // print("Final position: ${result['x']} , ${result['y']}");
  print("Final position: ${result['x']} , ${result['y']}");

  // Use AI to print direction
  print("Facing:  ${result['direction'].toString().split('.').last}");

}

Direction turnRightFunc(Direction direction){
  switch(direction){
    case Direction.north :
      return Direction.east;
    case Direction.east :
      return Direction.south;
    case Direction.south :
      return Direction.west;
    case Direction.west :
      return Direction.north;
  }
}

Direction turnLeftFunc(Direction direction){
  switch(direction){
    case Direction.north :
      return Direction.west;
    case Direction.east :
      return Direction.north;
    case Direction.south :
      return Direction.east;
    case Direction.west :
      return Direction.south;
  }
}

Map<String , int> advanceFunc(int x, int y, Direction direction){
  switch(direction){
    case Direction.north:
      y += 1;
      break;
    case Direction.east:
      x += 1;
      break;
    case Direction.south:
      y -= 1;
      break;
    case Direction.west:
      x -= 1;
      break;
  }
  return {'x': x , 'y':y};
}

Map<String , dynamic> OperationFunc(int x , int y, Direction direction , String instructions){
  for(var instr in instructions.split("")){
      if(instr == "R"){
        direction = turnRightFunc(direction);
      }else if(instr == "L"){
        direction = turnLeftFunc(direction);
      }else if(instr == "A"){
        var newPosition = advanceFunc(x, y, direction);
        x = newPosition['x']!;
        y = newPosition['y']!;
      }
  }
  return {'x':x , 'y':y , 'direction':direction};
}
