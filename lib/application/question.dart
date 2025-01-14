import 'package:flutter/material.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswer});
}

List<Question> questions = [
  Question(
      question: 'What is the capital of France?',
      options: ['Paris', 'London', 'Berlin'],
      correctAnswer: 'Paris'),
  Question(
      question: 'What is the largest planet in our solar system?',
      options: ['Mars', 'Jupiter', 'Saturn'],
      correctAnswer: 'Jupiter'),
  Question(
      question: 'Who painted the Mona Lisa?',
      options: ['Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh'],
      correctAnswer: 'Leonardo da Vinci'),
  Question(
      question: 'What is the chemical symbol for gold?',
      options: ['Ag', 'Au', 'Cu'],
      correctAnswer: 'Au'),
];

class QuestionPage extends StatelessWidget {
  final Question question;

  const QuestionPage({required this.question});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: SizedBox(
          width: 1550,
          height: 800,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xFFE29F5D)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Pertanyaan',
                      style: TextStyle(
                        fontFamily: 'League Spartan Bold',
                        fontSize: 75,
                        color: Color(0xFF582E1A),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(questions[0].question,
                            style: TextStyle(
                              fontFamily: 'Inter Bold',
                              fontSize: 50,
                              color: Color(0xFF582E1A),
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                            'A. ${questions[0].options[0]}\nB. ${questions[0].options[1]}\nC. ${questions[0].options[2]}',
                            style: TextStyle(
                              fontFamily: 'Inter Bold',
                              fontSize: 50,
                              color: Color(0xFF582E1A),
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF582E1A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                      fontFamily: 'Inter Bold',
                                      fontSize: 50,
                                      color: Color(0xFFFFFFFF)),
                                )),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF582E1A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'B',
                                  style: TextStyle(
                                      fontFamily: 'Inter Bold',
                                      fontSize: 50,
                                      color: Color(0xFFFFFFFF)),
                                )),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF582E1A),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                      fontFamily: 'Inter Bold',
                                      fontSize: 50,
                                      color: Color(0xFFFFFFFF)),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
