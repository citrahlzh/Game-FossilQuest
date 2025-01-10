import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/application/random_image.dart';
import 'package:game_fossilquest/application/guide.dart';
import 'package:game_fossilquest/application/result.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFD4A373),
          ),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 62),
                  child: Stack(children: [
                    SizedBox.expand(
                        child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0x99633925),
                      ),
                    )),
                    ...List.generate(3, (index) {
                      return RandomImage(
                        image: '../../assets/images/cracked.png',
                      );
                    })
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
                      Navigator.pop(context);
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
                        image:
                            Image.asset('../../assets/images/back_button.png')
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
                          context: context, builder: (context) => GuidePage());
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
                      Navigator.pushNamed(context, '/collection');
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
        ),
      ),
    );
  }
}
