// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:game_fossilquest/application/fossil_blank.dart';
// import 'package:game_fossilquest/bloc_manage/collection_bloc.dart';
// import 'package:game_fossilquest/database/app_database.dart';

// class CollectionPage extends StatelessWidget {
//   const CollectionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: DecoratedBox(
//             decoration: BoxDecoration(
//               color: Color(0xFFD4A373),
//             ),
//             child: Stack(
//               children: [
//                 Center(
//                   child: Padding(
//                       padding: EdgeInsets.fromLTRB(200, 210, 200, 100),
//                       child: Stack(children: [
//                         // Daun
//                         Positioned(
//                             bottom: 70,
//                             right: 70,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[0])),
//                             ])),
//                         // Ikan
//                         Positioned(
//                             top: 200,
//                             right: 0,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[1])),
//                             ])),
//                         // Kepala
//                         Positioned(
//                             top: 0,
//                             right: 300,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[2])),
//                             ])),
//                         // Kerang
//                         Positioned(
//                             bottom: 250,
//                             right: 100,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[3])),
//                             ])),
//                         // Mosasaurus
//                         Positioned(
//                             top: 10,
//                             left: 0,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[4])),
//                             ])),
//                         // Ornithopoda
//                         Positioned(
//                             bottom: 0,
//                             left: 360,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[5])),
//                             ])),
//                         // Pteranodon
//                         Positioned(
//                             bottom: 0,
//                             left: 40,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[6])),
//                             ])),
//                         // Theropoda
//                         Positioned(
//                             top: 0,
//                             left: 500,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[7])),
//                             ])),
//                         // Triceratops
//                         Positioned(
//                             top: 220,
//                             right: 270,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[8])),
//                             ])),
//                         // Tulang
//                         Positioned(
//                             top: 0,
//                             right: 40,
//                             child: Stack(children: [
//                               Image(image: AssetImage(blankFossil[9])),
//                             ])),
//                         // Tylosaurus
//                         Positioned(
//                             top: 170,
//                             left: 10,
//                             child: Stack(children: [
//                               Image(
//                                 image: AssetImage(blankFossil[10]),
//                               ),
//                             ])),
//                         // Tyrannosaurus
//                         Positioned(
//                             bottom: 290,
//                             left: 380,
//                             child: Stack(children: [
//                               Image(
//                                 image: AssetImage(blankFossil[11]),
//                               ),
//                             ])),
//                         // Velociraptor
//                         Positioned(
//                             bottom: 0,
//                             right: 340,
//                             child: Stack(children: [
//                               Image(
//                                 image: AssetImage(blankFossil[12]),
//                               ),
//                             ])),
//                         BlocBuilder<CollectionBloc, CollectionState>(
//                           builder: (context, state) {
//                             if (state is CollectionLoaded) {
//                               return Stack(
//                                 children: state.fossils.map((fossil) {
//                                   return Positioned(
//                                     // Sesuaikan posisi berdasarkan fossil yang didapatkan
//                                     top: 0,
//                                     left: 0,
//                                     child: Image.asset(
//                                       fossil.imagePath,
//                                       height: 100,
//                                       width: 100,
//                                     ),
//                                   );
//                                 }).toList(),
//                               );
//                             } else if (state is CollectionLoading) {
//                               return Center(child: CircularProgressIndicator());
//                             } else if (state is CollectionError) {
//                               return Center(child: Text(state.message));
//                             } else {
//                               return Container();
//                             }
//                           },
//                         ),
//                       ])),
//                 ),
//                 Positioned(
//                   width: 230,
//                   height: 120,
//                   top: 50,
//                   left: -90,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.fromLTRB(130, 45, 50, 45),
//                           backgroundColor: Color(0xFFB15707),
//                           elevation: 5),
//                       child: SizedBox(
//                         height: 80,
//                         child: Image(
//                           image: Image.asset('assets/images/back_button.png')
//                               .image,
//                         ),
//                       )),
//                 ),
//                 Positioned(
//                   top: 50,
//                   left: 170,
//                   child: SizedBox(
//                     height: 120,
//                     child: Center(
//                       child: Text(
//                         'KOLEKSI',
//                         style: TextStyle(
//                           color: Color(0xFF582E1A),
//                           fontFamily: 'Montserrat Bold',
//                           fontSize: 50,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/application/fossil_blank.dart';
import 'package:game_fossilquest/bloc_manage/collection_bloc.dart';
import 'package:game_fossilquest/database/app_database.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc(AppDatabase()),
      child: MaterialApp(
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
                    child: Stack(
                      children: [
                        ...List.generate(blankFossil.length, (index) {
                          return Positioned(
                            top: fossilPositions[index].top,
                            left: fossilPositions[index].left,
                            right: fossilPositions[index].right,
                            bottom: fossilPositions[index].bottom,
                            child: Image.asset(blankFossil[index]),
                          );
                        }),
                        BlocBuilder<CollectionBloc, CollectionState>(
                          builder: (context, state) {
                            if (state is CollectionLoaded) {
                              return Stack(
                                children: state.fossils.map((fossil) {
                                  int index =
                                      fossilNameToIndex[fossil.name] ?? -1;
                                  if (index == -1) return SizedBox.shrink();

                                  return Positioned(
                                    top: fossilPositions[index].top,
                                    left: fossilPositions[index].left,
                                    right: fossilPositions[index].right,
                                    bottom: fossilPositions[index].bottom,
                                    child: Image.asset(
                                      fossil.imagePath,
                                      height: 100,
                                      width: 100,
                                    ),
                                  );
                                }).toList(),
                              );
                            } else if (state is CollectionLoading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is CollectionError) {
                              return Center(child: Text(state.message));
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
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
                      elevation: 5,
                    ),
                    child: SizedBox(
                      height: 80,
                      child: Image.asset('assets/images/back_button.png'),
                    ),
                  ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Position {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  Position({
    this.left,
    this.top,
    this.right,
    this.bottom,
  });
}

final List<Position> fossilPositions = [
  Position(right: 70, bottom: 70), // Daun
  Position(top: 200, right: 0), // Ikan
  Position(top: 0, bottom: 300), // Kepala
  Position(right: 100, bottom: 250), // Kerang
  Position(top: 10, left: 0), // Mosasaurus
  Position(left: 360, bottom: 0), // Ornithopoda
  Position(left: 40, bottom: 0), // Pteranodon
  Position(left: 500, top: 0), // Theropoda
  Position(top: 220, right: 270), // Triceratops
  Position(right: 40, top: 0), // Tulang
  Position(left: 10, top: 170), // Tylosaurus
  Position(left: 380, bottom: 290), // Tyrannosaurus
  Position(right: 340, bottom: 0), // Velociraptor
];

final Map<String, int> fossilNameToIndex = {
  "Daun": 0,
  "Ikan": 1,
  "Kepala": 2,
  "Kerang": 3,
  "Mosasaurus": 4,
  "Ornithopoda": 5,
  "Pteranodon": 6,
  "Theropoda": 7,
  "Triceratops": 8,
  "Tulang": 9,
  "Tylosaurus": 10,
  "Tyrannosaurus": 11,
  "Velociraptor": 12,
};
