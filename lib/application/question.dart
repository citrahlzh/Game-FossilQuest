import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/bloc_manage/collection_bloc.dart';
import 'package:game_fossilquest/bloc_manage/game_bloc.dart';
import 'package:game_fossilquest/database/app_database.dart';
import 'package:game_fossilquest/presentation/collection.dart';
import 'package:game_fossilquest/application/questions_data.dart';

class QuestionPage extends StatelessWidget {
  final Question question;

  const QuestionPage({required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final gamebloc = GameBloc();
              gamebloc.add(ShowQuestionEvent(questions[0]));
              return gamebloc;
            },
          ),
          BlocProvider(
            lazy: false,
            create: (context) => CollectionBloc(AppDatabase()),
          )
        ],
        child: Builder(builder: (globalContext) {
          return BlocListener<GameBloc, GameState>(
            listener: (context, state) {
              if (state is ResultDisplayed) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    if (!state.isCorrect) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(); // Tutup dialog
                          Navigator.of(context)
                              .pop("reload"); // Tutup halaman question
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
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
                                                fontFamily:
                                                    'League Spartan Bold',
                                                fontSize: 75,
                                                color: Color(0xFF3f1400),
                                              ),
                                            ),
                                            Text('Kamu mendapatkan fossil...',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Montserrat Bold',
                                                    color: Color(0xFF3F1400),
                                                    fontSize: 50,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Image(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage(fossil.imagePath),
                                            ),
                                            SizedBox(
                                              height: 70,
                                              width: 400,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  final fossilToAdd =
                                                      FossilsCompanion(
                                                    name: drift.Value(
                                                        fossil.name),
                                                    imagePath: drift.Value(
                                                        fossil.imagePath),
                                                    description: drift.Value(
                                                        fossil.description),
                                                  );
                                                  globalContext
                                                      .read<CollectionBloc>()
                                                      .add(AddFossilEvent(
                                                          fossil: fossilToAdd));
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BlocProvider(
                                                                create: (context) =>
                                                                    CollectionBloc(
                                                                        AppDatabase()..getAllFossils()),
                                                                child:
                                                                    CollectionPage(),
                                                              )));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xFF582E1A),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
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
                                                            color: Color(
                                                                0xFF3F1400),
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
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            color: Color(
                                                                0xFF3F1400),
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
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
                                              onPressed: () {
                                                final fossilToAdd =
                                                    FossilsCompanion(
                                                  name:
                                                      drift.Value(fossil.name),
                                                  imagePath: drift.Value(
                                                      fossil.imagePath),
                                                  description: drift.Value(
                                                      fossil.description),
                                                );
                                                globalContext
                                                    .read<CollectionBloc>()
                                                    .add(AddFossilEvent(
                                                        fossil: fossilToAdd));
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BlocProvider(
                                                              create: (context) =>
                                                                  CollectionBloc(
                                                                      AppDatabase()),
                                                              child:
                                                                  CollectionPage(),
                                                            )));
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
                          ),
                        );
                      }
                    }
                  },
                );
              }
            },
            child: BlocBuilder<GameBloc, GameState>(builder: (context, state) {
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
            }),
          );
        }));
  }
}
