void main(){
  List<String> testCases = [
    "{what is (42)}?",
    "[text}",
    "{[[(a)b]c]d}",
    "{'{]'}",
    "({])",
    "]"

  ];
  for(var sentence in testCases){
    print("$sentence : ${checkingBracketsFunc(sentence) ? "Balanced" : "Not balanced"}");
  }
}

bool checkingBracketsFunc(String sentence){
    List<String> temp = [];
    Map<String, String> brackets = {
      ')': '(',
      '}': '{',
      ']': '[',
    };
    for(var character in sentence.split('')){
      if(character == '(' || character == '{' || character == '['){
        temp.add(character);
      }else  if(character == ')' || character == '}' || character == ']'){
        if(temp.isEmpty || temp.last != brackets[character]){
          return false;
        }else{
          temp.removeLast();
        }
      }
    }
    return temp.isEmpty;
}