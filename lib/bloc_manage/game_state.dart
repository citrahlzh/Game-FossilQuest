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

class QuestionDisplayed extends GameState {
  final Question question;
  final String? selectedOption;
  final String? feedbackBorder;

  QuestionDisplayed({
    required this.question,
    this.selectedOption,
    this.feedbackBorder,
  });
}