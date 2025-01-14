import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/application/question.dart';
import 'package:game_fossilquest/application/random_image.dart';
import 'package:game_fossilquest/application/guide.dart';
import 'package:game_fossilquest/bloc_manage/game_bloc.dart';
import 'package:game_fossilquest/presentation/collection.dart';
import 'package:game_fossilquest/presentation/dashboard.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is QuestionDisplayed) {
              final questionState = state as QuestionDisplayed;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  builder: (context) => QuestionPage(
                    question: questionState.question,
                  ),
                );
              });
            }

            return DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFD4A373),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 62),
                      child: Stack(children: [
                        SizedBox.expand(
                            child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0x99633925),
                          ),
                        )),
                        if (state is ImagesGenerated) ...[
                          ...List.generate(state.images.length, (index) {
                            final position = state.position[index];
                            return Stack(children: [
                              RandomImage(
                                image: state.images[index],
                                position: position,
                                onTap: () {
                                  context
                                      .read<GameBloc>()
                                      .add(OnTapImageEvent(index: index));
                                },
                              ),
                              if (state.overlayImages.containsKey(index))
                                RandomImage(
                                  image: state.overlayImages[index]!,
                                  position:
                                      Offset(position.dx + 8, position.dy - 17),
                                  onTap: () {
                                    context.read<GameBloc>().add(
                                        OnSecondTapImageEvent(index: index));
                                  },
                                ),
                            ]);
                          })
                        ] else ...[
                          Center(child: CircularProgressIndicator())
                        ],
                      ]),
                    ),
                  ),
                  Positioned(
                    width: 230,
                    height: 120,
                    top: 50,
                    left: -90,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardPage(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.fromLTRB(130, 45, 50, 45),
                            backgroundColor: Color(0xFFB15707),
                            elevation: 5),
                        child: SizedBox(
                          height: 80,
                          child: Image(
                            image: Image.asset(
                                    '../../assets/images/back_button.png')
                                .image,
                          ),
                        )),
                  ),
                  Positioned(
                    width: 170,
                    height: 90,
                    top: 218,
                    right: -90,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => GuidePage());
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.fromLTRB(0, 38, 0, 30),
                            backgroundColor: Color(0xFFB15707),
                            elevation: 5),
                        child: Transform.translate(
                          offset: Offset(-40, 0),
                          child: SizedBox(
                            height: 50,
                            child: Image(
                              image: Image.asset(
                                      '../../assets/images/guide_button.png')
                                  .image,
                            ),
                          ),
                        )),
                  ),
                  Positioned(
                    width: 230,
                    height: 180,
                    top: 50,
                    right: -90,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CollectionPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.fromLTRB(0, 50, 50, 50),
                            backgroundColor: Color(0xFFB15707),
                            elevation: 5),
                        child: Transform.translate(
                          offset: Offset(-10, 0),
                          child: SizedBox(
                            height: 75,
                            child: Image(
                              image: Image.asset(
                                      '../../assets/images/collection_button.png')
                                  .image,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
