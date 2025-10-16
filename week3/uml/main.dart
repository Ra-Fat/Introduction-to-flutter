class Quiz{
  List<Answer> _answers = [];

  void addAnswers(Answer answer){
    _answers.add(answer);
  }

  int getTotalQuestions(){
    return _answers.length;
  }

  int getScore(){
    return _answers.where((ans)=> ans.isGoodAnswer()).length;
  }
}

class Question{
  final String _title;
  final List<String> _choice; 
  final String _goodChoice;

  Question({required String title,required List<String> choice,required String goodChoice}) 
    : _title = title,
      _choice = choice,
      _goodChoice = goodChoice;

  String get title => _title;
  String get goodChoice => _goodChoice;
  List get choice => _choice;
}

class Answer{
  final String _answerChoice;
  final Question _question;

  Answer({required String answerChoice , required Question question})
    : _answerChoice = answerChoice,
      _question = question;
  
  String get  answerChoice => _answerChoice;
  Question get question => _question;

  bool isGoodAnswer(){
    return answerChoice == question._goodChoice;
  }
}

void main(){

  var q1 = Question(
    title: "What istg stand for ?", 
    choice: ["I swear to God", "In style to go", "I stay too good"],
    goodChoice: "I swear to God",
  );

  var q2 = Question(
    title: "What does the idiom 'break the ice' mean?",
    choice: [
      "Start a conversation in a social setting",
      "Break something cold",
      "Avoid talking to strangers"
    ],
    goodChoice: "Start a conversation in a social setting",
  );

  var q3 = Question(
    title: "What does 'spill the tea' mean?",
    choice: ["Tell gossip", "Make tea", "Keep a secret"],
    goodChoice: "Tell gossip",
  );

  var a1 = Answer(answerChoice: "I swear to God", question: q1);
  var a2 = Answer(answerChoice: "Avoid talking to strangers", question: q2);
  var a3 = Answer(answerChoice: "Tell gossip", question: q3);

  var quiz = Quiz();

  quiz.addAnswers(a1);
  quiz.addAnswers(a2);
  quiz.addAnswers(a3);


  for (var i = 0; i < quiz._answers.length; i++) {
    var ans = quiz._answers[i];
    print("\nQ${i + 1}: ${ans.question.title}");
    print("Ur answer: ${ans.answerChoice}");
    print("Correct answer: ${ans.question.goodChoice}");
    print(ans.isGoodAnswer() ? "Correct!!" : "Wrong!!");
  }

  double result = (quiz.getScore() / quiz.getTotalQuestions()) * 100;

  print("\nResult: ${result.toStringAsFixed(2)}%");

}