import 'package:flutter/material.dart';
import 'package:game_fossilquest/application/fossil.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //     backgroundColor: Colors.transparent,
    //     content: Center(
    //       child: SizedBox(
    //         width: 850,
    //         height: 500,
    //         child: DecoratedBox(
    //           decoration: BoxDecoration(
    //               color: Color(0xFFE29F5D),
    //               borderRadius: BorderRadius.all(Radius.circular(30))),
    //           child: Center(
    //             child: Padding(
    //               padding: const EdgeInsets.all(30),
    //               child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       'KAMU SALAH',
    //                       style: TextStyle(
    //                         fontFamily: 'League Spartan Bold',
    //                         fontSize: 75,
    //                         color: Color(0xFF3f1400),
    //                       ),
    //                     ),
    //                     Text('Fossil tak jadi didapatkan',
    //                         style: TextStyle(
    //                             fontFamily: 'Montserrat Bold',
    //                             color: Color(0xFF3F1400),
    //                             fontSize: 50)),
    //                   ]),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));

    // return AlertDialog(
    //     backgroundColor: Colors.transparent,
    //     content: Center(
    //       child: SizedBox(
    //         width: 700,
    //         height: 800,
    //         child: DecoratedBox(
    //           decoration: BoxDecoration(
    //               color: Color(0xFFE29F5D),
    //               borderRadius: BorderRadius.all(Radius.circular(30))),
    //           child: Center(
    //             child: Padding(
    //               padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
    //               child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       'KAMU BENAR',
    //                       style: TextStyle(
    //                         fontFamily: 'League Spartan Bold',
    //                         fontSize: 75,
    //                         color: Color(0xFF3f1400),
    //                       ),
    //                     ),
    //                     Text('Kamu mendapatkan fossil...',
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(
    //                             fontFamily: 'Montserrat Bold',
    //                             color: Color(0xFF3F1400),
    //                             fontSize: 50,
    //                             fontWeight: FontWeight.bold)),
    //                     Image(
    //                       fit: BoxFit.cover,
    //                       image: AssetImage(fossils[0].imagePath),
    //                     ),
    //                     SizedBox(
    //                       height: 70,
    //                       width: 400,
    //                       child: ElevatedButton(
    //                         onPressed: () {},
    //                         style: ElevatedButton.styleFrom(
    //                           backgroundColor: Color(0xFF582E1A),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(20),
    //                           ),
    //                         ),
    //                         child: Text(
    //                           'Masukkan ke Koleksi',
    //                           style: TextStyle(
    //                               fontFamily: 'Montserrat Bold',
    //                               fontSize: 25,
    //                               color: Color(0xFFFFE9D3)),
    //                         ),
    //                       ),
    //                     )
    //                   ]),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: SizedBox(
          width: 1550,
          height: 800,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFE29F5D),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
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
                                        fontSize: 40)),
                                Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(fossils[4].imagePath),
                                )
                              ],
                            ),
                            SizedBox(width: 100),
                            SizedBox(
                              width: 500,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fossils[4].name,
                                    style: TextStyle(
                                      fontFamily: 'League Spartan Bold',
                                      color: Color(0xFF3F1400),
                                      fontSize: 70,
                                    ),
                                  ),
                                  Text(
                                    fossils[4].description,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat Medium',
                                        color: Color(0xFF3F1400),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
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
