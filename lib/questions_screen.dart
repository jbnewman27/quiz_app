
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget{ 
    const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function (String answer) onSelectedAnswer;

    State<QuestionsScreen> createState(){
      return _QuestionsScreenState();
    }
}
class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context){
    void answerQuestion(String selectedAnswer){
      widget.onSelectedAnswer(selectedAnswer);
       setState(() {
                  currentQuestionIndex++;
                });
    }
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.question,
            style:GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
            ,
            textAlign: TextAlign.center,),
            const SizedBox(height:30),
            ...currentQuestion.getShuffledAnswers().map((item){
              return AnswerButton(answerText: item, onTap: (){
                answerQuestion(item);
              }
              );
            })
          ],
        ),
      ),
    );
  }
}