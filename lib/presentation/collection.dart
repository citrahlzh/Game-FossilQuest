import 'package:flutter/material.dart';
import 'dart:math';
import 'package:game_fossilquest/application/fossil.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFD4A373),
            ),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(200, 210, 200, 100),
                      child: Stack(children: [
                        // Daun
                        Positioned(
                            bottom: 70,
                            right: 70,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[0].image,
                              ),
                            ])),
                        // Ikan
                        Positioned(
                            top: 200,
                            right: 0,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[1].image,
                              ),
                            ])),
                        // Kepala
                        Positioned(
                            top: 0,
                            right: 300,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[2].image,
                              ),
                            ])),
                        // Kerang
                        Positioned(
                            bottom: 250,
                            right: 100,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[3].image,
                              ),
                            ])),
                        // Mosasaurus
                        Positioned(
                            top: 10,
                            left: 0,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[4].image,
                              ),
                            ])),
                        // Ornithopoda
                        Positioned(
                            bottom: 0,
                            left: 360,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[5].image,
                              ),
                            ])),
                        // Pteranodon
                        Positioned(
                            bottom: 0,
                            left: 40,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[6].image,
                              ),
                            ])),
                        // Theropoda
                        Positioned(
                            top: 0,
                            left: 500,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[7].image,
                              ),
                            ])),
                        // Triceratops
                        Positioned(
                            top: 220,
                            right: 270,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[8].image,
                              ),
                            ])),
                        // Tulang
                        Positioned(
                            top: 0,
                            right: 40,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[9].image,
                              ),
                            ])),
                        // Tylosaurus
                        Positioned(
                            top: 170,
                            left: 10,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[10].image,
                              ),
                            ])),
                        // Tyrannosaurus
                        Positioned(
                            bottom: 290,
                            left: 380,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[11].image,
                              ),
                            ])),
                        // Velociraptor
                        Positioned(
                            bottom: 0,
                            right: 340,
                            child: Stack(children: [
                              Image(
                                image: collectionImages[12].image,
                              ),
                            ])),
                      ])),
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
                  top: 50,
                  left: 170,
                  child: SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        'KOLEKSI',
                        style: TextStyle(
                          color: Color(0xFF582E1A),
                          fontFamily: 'Montserrat Bold',
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
