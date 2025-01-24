import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_fossilquest/bloc_manage/collection_bloc.dart';

class FossilCollectionStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        if (state is CollectionLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CollectionLoaded) {
          final fossils = state.fossils;

          if (fossils.isEmpty) {
            return Center(child: Text('No fossils in collection.'));
          }

          return Stack(
            alignment: Alignment.center,
            children: fossils.map((fossil) {
              return Positioned(
                top: fossils.indexOf(fossil) * 10.0, // Offset untuk tumpukan
                child: Image.asset(
                  fossil.imagePath,
                  height: 100,
                  width: 100,
                ),
              );
            }).toList(),
          );
        } else if (state is CollectionError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Something went wrong.'));
        }
      },
    );
  }
}
