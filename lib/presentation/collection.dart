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
      create: (context) => CollectionBloc(AppDatabase())..add(LoadCollectionEvent()),
      child: Scaffold(
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
                                int index = fossilNameToIndex[fossil.name] ?? -1;
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
                    child: Image(
                      image: Image.asset('assets/images/back_button.png').image,
                    ),
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
    );
  }
}

class FossilPosition {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  FossilPosition({this.top, this.left, this.right, this.bottom});
}

final List<FossilPosition> fossilPositions = [
  FossilPosition(top: 70, right: 70),
  FossilPosition(top: 200, right: 0),
  FossilPosition(top: 0, right: 300),
  FossilPosition(bottom: 250, right: 100),
  FossilPosition(top: 10, left: 0),
  FossilPosition(bottom: 0, left: 360),
  FossilPosition(bottom: 0, left: 40),
  FossilPosition(top: 0, left: 500),
  FossilPosition(top: 220, right: 270),
  FossilPosition(top: 0, right: 40),
  FossilPosition(top: 170, left: 10),
  FossilPosition(bottom: 290, left: 380),
  FossilPosition(bottom: 0, right: 340),
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