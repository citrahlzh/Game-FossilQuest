import 'package:flutter/material.dart';
import 'package:game_fossilquest/application/fossil.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Kamu mendapatkan fossil...',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat Bold',
                                        color: Color(0xFF3F1400),
                                        fontSize: 30)),
                                Image(
                                  image: fossils[4].image.image,
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fossils[4].name,
                                  style: TextStyle(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        width: 700,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF582E1A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
