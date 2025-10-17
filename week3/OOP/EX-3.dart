class CustomDuration{
  final int _milliseconds;

  CustomDuration._(int milliseconds): _milliseconds = milliseconds{
    if (_milliseconds < 0) {
      throw Exception("Duration cannot negative");
    }
  }

  CustomDuration.fromHours(int hours) 
    : this._(hours * 60 * 60 * 1000);
  CustomDuration.fromMinutes(int minutes) 
    : this._(minutes * 60 * 1000);
  CustomDuration.fromSeconds(int seconds) 
    : this._(seconds * 1000);

  int get inMilliseconds => _milliseconds;

  bool operator >(CustomDuration anotherDuration){
    return _milliseconds > anotherDuration._milliseconds;
  }


  CustomDuration operator +(CustomDuration anotherDuration){
    return CustomDuration._(_milliseconds + anotherDuration._milliseconds);
  }

  CustomDuration operator -(CustomDuration anotherDuration){
    int result = _milliseconds - anotherDuration._milliseconds;
    if(result < 0){
      throw Exception("Duration cannot negative");
    }
    return CustomDuration._(result);
  }

  @override
  String toString(){
    int totalSeconds = _milliseconds ~/ 1000;
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds ~/ 60) % 60;
    int seconds = totalSeconds % 60;
    return "${hours}h ${minutes}m ${seconds}s";
  }
}


void main(){
  var dur1 = CustomDuration.fromMinutes(90);
  var dur2 = CustomDuration.fromSeconds(1800);
  

  // var dur1 = CustomDuration.fromMinutes(0);
  // var dur2 = CustomDuration.fromSeconds(1800);

  // var dur1 = CustomDuration.fromHours(3);
  // var dur2 = CustomDuration.fromSeconds(1800);

  // var dur1 = CustomDuration.fromMinutes(90);
  // var dur2 = CustomDuration.fromSeconds(-10);

  print(dur1);
  print(dur2);
  // print(test);

  print("Comparison: ${dur1 > dur2}");

  var sum = dur1 + dur2;
  print("Sum: $sum");

  var minus = dur1 - dur2;
  print("Minus Duration(D1 - D2): $minus");

  // test case to make smaller dur to minus the big one
  print("Minus Duration(D2 - D1):");
  try{
    var invalid = dur2 - dur1;
    print(invalid);
  } catch (e) {
    print(e);
  }
}
