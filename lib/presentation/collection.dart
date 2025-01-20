import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/application/fossil_blank.dart';
import 'package:game_fossilquest/bloc_manage/collection_bloc.dart';
import 'package:game_fossilquest/collection/fossils.dart';
import 'package:game_fossilquest/collection/isar_service.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CollectionBloc(IsarService())..add(LoadCollectionEvent()),
      child: MaterialApp(
        home: Scaffold(
          body: BlocBuilder<CollectionBloc, CollectionState>(
            builder: (context, state) {
              if (state is CollectionLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CollectionError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is CollectionLoaded) {
                final collectedFossils = state.fossils;

                return DecoratedBox(
                  decoration: const BoxDecoration(color: Color(0xFFD4A373)),
                  child: Stack(
                    children: [
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(200, 210, 200, 100),
                          child: Stack(
                            children:
                                List.generate(blankFossil.length, (index) {
                              // Cari fossil berdasarkan nama
                              final fossil = collectedFossils.firstWhere(
                                (fossil) =>
                                    fossil.name == fossilNameMapping[index],
                                orElse: () => FossilData(
                                    name: 'Unknown',
                                    imagePath: 'path/to/placeholder.png',
                                    description: 'No description'),
                              );

                              return Positioned(
                                top: fossilPositions[index].dy,
                                left: fossilPositions[index].dx,
                                child: Stack(
                                  children: [
                                    // Gambar blank
                                    Image.asset(blankFossil[index]),
                                    // Jika fossil ditemukan, tampilkan di atas gambar blank
                                    if (fossil.name != 'Unknown')
                                      Image.asset(
                                        fossil.imagePath,
                                        width: 100,
                                        height: 100,
                                      ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 230,
                        height: 120,
                        top: 50,
                        left: -90,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.fromLTRB(130, 45, 50, 45),
                            backgroundColor: const Color(0xFFB15707),
                            elevation: 5,
                          ),
                          child: const SizedBox(
                            height: 80,
                            child: Image(
                              image: AssetImage(
                                  '../../assets/images/back_button.png'),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
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
                );
              }

              return const Center(child: Text('Unknown state'));
            },
          ),
        ),
      ),
    );
  }
}

const List<Offset> fossilPositions = [
  Offset(70, 70), // Daun (bottom: 70, right: 70)
  Offset(200, 0), // Ikan (top: 200, right: 0)
  Offset(0, 300), // Kepala (top: 0, right: 300)
  Offset(250, 100), // Kerang (bottom: 250, right: 100)
  Offset(10, 0), // Mosasaurus (top: 10, left: 0)
  Offset(0, 360), // Ornithopoda (bottom: 0, left: 360)
  Offset(0, 40), // Pteranodon (bottom: 0, left: 40)
  Offset(0, 500), // Theropoda (top: 0, left: 500)
  Offset(220, 270), // Triceratops (top: 220, right: 270)
  Offset(0, 40), // Tulang (top: 0, right: 40)
  Offset(170, 10), // Tylosaurus (top: 170, left: 10)
  Offset(290, 380), // Tyrannosaurus (bottom: 290, left: 380)
  Offset(0, 340), // Velociraptor (bottom: 0, right: 340)
];

const List<String> fossilNameMapping = [
  'Daun',
  'Ikan',
  'Kepala',
  'Kerang',
  'Mosasaurus',
  'Ornithopoda',
  'Pteranodon',
  'Theropoda',
  'Triceratops',
  'Tulang',
  'Tylosaurus',
  'Tyrannosaurus',
  'Velociraptor',
];
