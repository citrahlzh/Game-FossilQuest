import 'package:bloc/bloc.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_fossilquest/application/question.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  int? lastTappedIndex;

  GameBloc() : super(InitialState()) {
    on<StartGameEvent>(_onStartGame);
    on<OnTapImageEvent>(_onTapImage);
    on<SelectAnswerEvent>(_onSelectAnswer);
    on<ShowQuestionEvent>(_onShowQuestion);
  }

  void _onStartGame(StartGameEvent event, Emitter<GameState> emit) {
    final images = List.generate(3, (_) => '/assets/images/cracked.png');
    final position = List.generate(
      3,
      (_) {
        final random = Random();
        final top = random.nextInt(event.screenHeight.toInt() - 300).toDouble();
        final left = random.nextInt(event.screenWidth.toInt() - 400).toDouble();
        return Offset(left, top);
      },
    );

    emit(ImagesGenerated(images, position, {}));
  }

  void _onTapImage(OnTapImageEvent event, Emitter<GameState> emit) {
    if (state is ImagesGenerated) {
      final currentState = state as ImagesGenerated;

      final updatedOverlayImages =
          Map<int, String>.from(currentState.overlayImages);
      updatedOverlayImages[event.index] = '/assets/images/revealed.png';

      lastTappedIndex = event.index;

      emit(ImagesGenerated(
        currentState.images,
        currentState.position,
        updatedOverlayImages,
      ));
    }
  }

  void _onShowQuestion(ShowQuestionEvent event, Emitter<GameState> emit) {
    emit(QuestionDisplayed(
      question: event.question,
      selectedOption: null,
      feedbackBorder: null,
    ));
  }

  void _onSelectAnswer(SelectAnswerEvent event, Emitter<GameState> emit) {
    if (state is QuestionDisplayed) {
      final currentState = state as QuestionDisplayed;

      final feedbackBorder =
          event.selectedOption == currentState.question.correctAnswer
              ? 'correct'
              : 'wrong';

      emit(QuestionDisplayed(
        question: currentState.question,
        selectedOption: event.selectedOption,
        feedbackBorder: feedbackBorder,
      ));
    }
  }
}
