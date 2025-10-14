void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  List<int> studentPassed = scores.where((score)=> score > 50).toList();
  print(studentPassed);
  print("${studentPassed.length} students passed");
 
}