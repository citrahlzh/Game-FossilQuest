part of 'game_bloc.dart';

abstract class GameState {}

class InitialState extends GameState {}

class ImagesGenerated extends GameState {
  final List<String> images;

  ImagesGenerated(this.images);
}

class ImageTappedOnce extends GameState {
  final List<String> images;
  final int tappedIndex;

  ImageTappedOnce(this.images, this.tappedIndex);
}

class QuestionDisplayed extends GameState {
  final List<String> images;
  final int tappedIndex;

  QuestionDisplayed(this.images, this.tappedIndex);
}


// abstract class GameState extends Equatable{
//   final String? question;
//   final List<String>? options;
//   final int? randomImageIndex;

//   const GameState({this.question, this.options, this.randomImageIndex});
// }

// // class GameInitialState extends GameState {}
// // class GameQuestionState extends GameState {
// //   final String question;
// //   final List<String> options;
// //   final int randomImageIndex;

// //   GameQuestionState(
// //       {required this.question,
// //       required this.options,
// //       required this.randomImageIndex});
// // }
// // class GameResultState extends GameState {
// //   final bool isCorrect;
// //   final Fossil? fossil;

// //   GameResultState({required this.isCorrect, this.fossil});
// // }
