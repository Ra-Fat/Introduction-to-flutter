import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';


class Quizrepository {
    final String filePath ;
    Quizrepository(this.filePath);

    // Get the quiz from file
    Quiz getQuiz(){
        final jsonFile = File(filePath);
        if(!jsonFile.existsSync()){
            throw Exception('file not found 404');
        }


        // get data as string then convert it into map or list
        final data = jsonDecode(jsonFile.readAsStringSync());

        // Retrive data from question 
        final questionInFile = data['questions'] as List<dynamic>;
        final questions = questionInFile.map((q){
            return Question(
                id: q['id'],
                title: q['title'],
                choices: List<String>.from(q['choices']),
                goodChoice: q['goodChoice'],
                score: q['score'],
            );
        }).toList();

        final quiz = Quiz(
            id: data['id'],
            questions: questions,
        );
        return quiz;
    }


    // At player info attemp to file
    void uploadPlayerAttemped(Quiz quiz , {required String playerName}){

        final jsonFile = File(filePath);
        jsonFile.parent.createSync(recursive: true);
        if (!jsonFile.existsSync() || jsonFile.readAsStringSync().isEmpty) {
            throw Exception('file does not exist or it is empty.');
        }
        
        // get data as string then convert it into map or list
        final data = jsonDecode(jsonFile.readAsStringSync());
        List<dynamic> submissions = data['submissions'] ?? [];

        int playerExisted = submissions.indexWhere((s)=> s['player'] == playerName);

        Map<String, dynamic> playerData = {
            'player': playerName,
            'score': quiz.getScoreInPoint(),
            'answers': quiz.answers.map((a) => {
              'questionId': a.question.id,
              'chosenAnswer': a.answerChoice
            }).toList()
        };

        // Check if the user already attemp the quiz
        if(playerExisted >= 0){
            // Overwrite the prev data of them
            submissions[playerExisted] = playerData;
        }else{
            submissions.add(playerData);
        }

        data['submissions'] = submissions;

        // upload player attemped data to file as json format
        jsonFile.writeAsStringSync(JsonEncoder.withIndent(' ').convert(data));
    }

    // Create the quiz if it not exist
    void createDefaultQuiz(Quiz quiz){
        final jsonFile = File(filePath);
        jsonFile.parent.createSync(recursive: true);

        Map<String, dynamic> data = {};
        if (jsonFile.existsSync() && jsonFile.readAsStringSync().isNotEmpty) {
          data = jsonDecode(jsonFile.readAsStringSync());
        }

        data['id'] = quiz.id;
        data['questions'] = quiz.questions.map((q)=>{
            'id': q.id,
            'title': q.title,
            'choices': q.choices,
            'goodChoice': q.goodChoice,
            'score': q.score,
        }).toList();

        if (!data.containsKey('submissions')){
            data['submissions'] = [];
        }

        // Write quiz data to file as json format
        jsonFile.writeAsStringSync(JsonEncoder.withIndent(' ').convert(data));
    }
}