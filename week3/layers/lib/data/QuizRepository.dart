import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class Quizrepository {
    final String filePath ;
    Quizrepository(this.filePath);

    Quiz getQuiz(){

        final jsonFile = File(filePath);
        if(!jsonFile.existsSync()){
            throw Exception('file not found 404');
        }

        final data = jsonDecode(jsonFile.readAsStringSync());

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

    void uploadPlayerAttempted(Quiz quiz, Submission submission, {required String playerName}){

        final jsonFile = File(filePath);
        jsonFile.parent.createSync(recursive: true);
        if (!jsonFile.existsSync() || jsonFile.readAsStringSync().isEmpty){
            throw Exception('file does not exist or it is empty.');
        }

        final data = jsonDecode(jsonFile.readAsStringSync());

        submission.insertPlayerSubmission(data, quiz, playerName: playerName);

        jsonFile.writeAsStringSync(JsonEncoder.withIndent(' ').convert(data));
    }
}