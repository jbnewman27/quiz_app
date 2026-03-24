import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: summaryData.map((data) {
        final isCorrectAnswer = data['correct_answer'] == data['user_answer'];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 27,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: isCorrectAnswer ? const Color.fromARGB(255, 96, 248, 103) : const Color.fromARGB(255, 255, 0, 0),
                borderRadius: BorderRadius.circular(100)),
                child: Text(((data['question_index'] as int) + 1).toString(), 
                style:GoogleFonts.lato(color: const Color.fromARGB(255, 0, 0, 0))),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String,
                     style:GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                   ),
                   textAlign: TextAlign.left,),
                    const SizedBox(height: 5),
                    Text(data['user_answer'] as String,
                    style:GoogleFonts.lato(
                    color: const Color.fromARGB(255, 255, 247, 89),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                   ),
                    ),
                    Text(data['correct_answer'] as String,
                    style:GoogleFonts.lato(
                    color: const Color.fromARGB(255, 230, 117, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                   ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
