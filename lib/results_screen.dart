
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary =[];
    for(var i = 0;i < chosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].question,
        'correct_answer':questions[i].answers[0],
        'user_answer':chosenAnswers[i]
      }); 
    }
    return summary;
  }

  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where(
      (data){
        return data['correct_answer'] == data['user_answer'];
      }
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const SizedBox(height: 100),
            Text('You answered $numTotalCorrect out of $numTotalQuestions questions Correctly!',
            style:GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
            ,
            textAlign: TextAlign.center,),
            const SizedBox(height:20,),
            Expanded(child: SingleChildScrollView( child: QuestionSummary(summaryData: summaryData),),),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}