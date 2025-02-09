part of 'game_bloc.dart';

abstract class GameState {}

class InitialState extends GameState {}

class ImagesGenerated extends GameState {
  final List<String> images;
  final List<Offset> position;
  final Map<int, String> overlayImages;

  ImagesGenerated(this.images, this.position, this.overlayImages);
}

class ImageTappedOnce extends GameState {
  final List<String> images;
  final int tappedIndex;

  ImageTappedOnce(this.images, this.tappedIndex);

  List<Object?> get props => [images, tappedIndex];
}

class GameInProgress extends GameState {
  final List<String> images;
  final List<Offset> positions;
  final Map<int, String> overlayImages;

  GameInProgress({
    required this.images,
    required this.positions,
    required this.overlayImages,
  });
}


class QuestionDisplayed extends GameState {
  final Question question;
  final List<String> shuffledOptions;
  final String? selectedOption;
  final String? feedbackBorder;

  QuestionDisplayed({
    required this.question,
    required this.shuffledOptions,
    this.selectedOption,
    this.feedbackBorder,
  });
}

class ResultDisplayed extends GameState {
  final bool isCorrect;
  final Fossil? fossil;

  ResultDisplayed({required this.isCorrect, this.fossil});
}
