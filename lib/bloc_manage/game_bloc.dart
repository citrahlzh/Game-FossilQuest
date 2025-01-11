import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:game_fossilquest/collection/fossils.dart';
import 'package:game_fossilquest/application/fossil.dart';
import 'package:game_fossilquest/application/question.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(InitialState());

  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is StartGameEvent) {
      // Generate 3 random image paths
      final images = List.generate(
        3,
        (index) => '../../assets/images/cracked.png',
      );
      yield ImagesGenerated(images);
    } else if (event is TapImageEvent && state is ImagesGenerated) {
      final currentState = state as ImagesGenerated;
      yield ImageTappedOnce(currentState.images, event.index);
    } else if (event is TapImageEvent && state is ImageTappedOnce) {
      final currentState = state as ImageTappedOnce;
      yield QuestionDisplayed(currentState.images, event.index);
    }
  }
}
