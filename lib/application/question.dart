import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/collection/fossils.dart';
import 'package:game_fossilquest/collection/isar_service.dart';
import 'package:game_fossilquest/bloc_manage/game_bloc.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswer});

  List<String> getShuffledOptions() {
    final shuffledOptions = List<String>.from(options)..shuffle();
    return shuffledOptions;
  }
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

  const QuestionPage({required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          final gamebloc = GameBloc();
          gamebloc.add(ShowQuestionEvent(questions[0]));
          return gamebloc;
        },
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is ResultDisplayed) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  if (!state.isCorrect) {
                    return GestureDetector(
                      onTap: () {
                        final screenWidth = MediaQuery.of(context).size.width;
                        final screenHeight = MediaQuery.of(context).size.height;

                        Navigator.of(context).pop();
                        context.read<GameBloc>().add(
                              StartGameEvent(
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight),
                            );
                      },
                      child: AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Center(
                          child: SizedBox(
                            width: 850,
                            height: 500,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color(0xFFE29F5D),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'KAMU SALAH',
                                          style: TextStyle(
                                            fontFamily: 'League Spartan Bold',
                                            fontSize: 75,
                                            color: Color(0xFF3f1400),
                                          ),
                                        ),
                                        Text('Fossil tak jadi didapatkan',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat Bold',
                                                color: Color(0xFF3F1400),
                                                fontSize: 50)),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    final isarService = IsarService();
                    final fossil = state.fossil!;

                    if (['Daun', 'Tulang', 'Kepala', 'Kerang', 'Ikan']
                        .contains(fossil.name)) {
                      return AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Center(
                            child: SizedBox(
                              width: 700,
                              height: 800,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color(0xFFE29F5D),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 30, 50, 30),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'KAMU BENAR',
                                            style: TextStyle(
                                              fontFamily: 'League Spartan Bold',
                                              fontSize: 75,
                                              color: Color(0xFF3f1400),
                                            ),
                                          ),
                                          Text('Kamu mendapatkan fossil...',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat Bold',
                                                  color: Color(0xFF3F1400),
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold)),
                                          Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(fossil.imagePath),
                                          ),
                                          SizedBox(
                                            height: 70,
                                            width: 400,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                final isarFossil = FossilData(
                                                  name: fossil.name,
                                                  imagePath: fossil.imagePath,
                                                  description:
                                                      fossil.description,
                                                );
                                                await isarService
                                                    .addFossil(isarFossil);
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF582E1A),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: Text(
                                                'Masukkan ke Koleksi',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Montserrat Bold',
                                                    fontSize: 25,
                                                    color: Color(0xFFFFE9D3)),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ));
                    } else {
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Center(
                          child: SizedBox(
                            width: 1550,
                            height: 800,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Color(0xFFE29F5D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'KAMU BENAR',
                                          style: TextStyle(
                                            fontFamily: 'League Spartan Bold',
                                            fontSize: 75,
                                            color: Color(0xFF3f1400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 500,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Kamu mendapatkan fossil...',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat Bold',
                                                          color:
                                                              Color(0xFF3F1400),
                                                          fontSize: 40)),
                                                  Image(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        fossil.imagePath),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 100),
                                              SizedBox(
                                                width: 500,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      fossil.name,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'League Spartan Bold',
                                                        color:
                                                            Color(0xFF3F1400),
                                                        fontSize: 70,
                                                      ),
                                                    ),
                                                    Text(
                                                      fossil.description,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat Medium',
                                                          color:
                                                              Color(0xFF3F1400),
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 70,
                                          width: 700,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              final isarFossil = FossilData(
                                                name: fossil.name,
                                                imagePath: fossil.imagePath,
                                                description: fossil.description,
                                              );
                                              await isarService
                                                  .addFossil(isarFossil);
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF582E1A),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Text(
                                              'Masukkan ke Koleksi',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat Bold',
                                                  fontSize: 25,
                                                  color: Color(0xFFFFE9D3)),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
              if (state is QuestionDisplayed) {
                final optionString = [
                  'A. ${state.shuffledOptions[0]}',
                  'B. ${state.shuffledOptions[1]}',
                  'C. ${state.shuffledOptions[2]}',
                ].join('\n');

                BorderSide getBorderStyle(
                  String? selectedOption,
                  String currentOption,
                  String? feedbackBorder,
                ) {
                  if (selectedOption == currentOption) {
                    return feedbackBorder == 'correct'
                        ? const BorderSide(color: Colors.white, width: 8)
                        : const BorderSide(color: Colors.red, width: 8);
                  }
                  return BorderSide.none;
                }

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
                                    Text(optionString,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: state.shuffledOptions
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      final index = entry
                                          .key; // 0, 1, 2 untuk opsi A, B, C
                                      final option =
                                          entry.value; // Opsi yang sesuai

                                      // Huruf A, B, C, ... berdasarkan index
                                      final label =
                                          String.fromCharCode(65 + index);

                                      return SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context.read<GameBloc>().add(
                                                  SelectAnswerEvent(option),
                                                );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF582E1A),
                                            side: getBorderStyle(
                                              state.selectedOption,
                                              option,
                                              state.feedbackBorder,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Text(
                                            label, // Label tombol (A, B, C)
                                            style: const TextStyle(
                                              fontFamily: 'Inter Bold',
                                              fontSize: 50,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (state is ResultDisplayed) {
                return const SizedBox();
              }

              return const Center(child: CircularProgressIndicator());
            });
          },
        ));
  }
}
