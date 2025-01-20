import 'package:bloc/bloc.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_fossilquest/application/question.dart';
import 'package:game_fossilquest/application/fossil.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  int? lastTappedIndex;

  GameBloc() : super(InitialState()) {
    on<StartGameEvent>(_onStartGame);
    on<OnTapImageEvent>(_onTapImage);
    on<SelectAnswerEvent>(_onSelectAnswer);
    on<ShowQuestionEvent>(_onShowQuestion);
    on<ShowResultEvent>(_onShowResult);
    // on<ResetGameEvent>(_onResetGame);
    // on<RestoreGameStateEvent>(_onRestoreGameState);
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
    if (state is GameInProgress) {
      final currentState = state as GameInProgress;

      emit(GameInProgress(
        images: currentState.images,
        positions: currentState.positions,
        overlayImages: currentState.overlayImages,
      ));
    }

    emit(QuestionDisplayed(
      question: event.question,
      shuffledOptions: event.question.getShuffledOptions(),
      selectedOption: null,
      feedbackBorder: null,
    ));
  }

  void _onSelectAnswer(SelectAnswerEvent event, Emitter<GameState> emit) {
    if (state is QuestionDisplayed) {
      final currentState = state as QuestionDisplayed;

      final isCorrect =
          event.selectedOption == currentState.question.correctAnswer;

      emit(QuestionDisplayed(
        question: currentState.question,
        shuffledOptions: currentState.shuffledOptions,
        selectedOption: event.selectedOption,
        feedbackBorder: isCorrect ? 'correct' : 'wrong',
      ));

      Future.delayed(const Duration(seconds: 1), () {
        add(ShowResultEvent(isCorrect));
      });
    }
  }

  void _onShowResult(ShowResultEvent event, Emitter<GameState> emit) {
    if (state is QuestionDisplayed) {
      if (event.isCorrect) {
        final randomFossil = (fossils..shuffle()).first;
        emit(ResultDisplayed(isCorrect: true, fossil: randomFossil));
      } else {
        emit(ResultDisplayed(isCorrect: false, fossil: null));
      }
    }
  }

//   void _onResetGame(ResetGameEvent event, Emitter<GameState> emit) {
//   // Generate gambar dan posisi baru
//   final random = Random();
//   final images = List.generate(3, (_) => '/assets/images/cracked.png');
//   final positions = List.generate(
//     3,
//     (_) => Offset(
//       random.nextDouble() * (event.screenWidth - 100), // Lebar acak
//       random.nextDouble() * (event.screenHeight - 100), // Tinggi acak
//     ),
//   );

//   // Emit state baru untuk permainan
//   emit(GameInProgress(
//     images: images,
//     positions: positions,
//     overlayImages: {}, // Reset overlay
//   ));
// }

  // void _onRestoreGameState(
  //     RestoreGameStateEvent event, Emitter<GameState> emit) {
  //   if (state is GameInProgress) {
  //     emit(state);
  //   } else {
  //     print('Tidak ada state GameInProgress untuk dikembalikan');
  //   }
  // }
}
