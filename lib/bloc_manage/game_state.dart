part of 'game_bloc.dart';

abstract class GameState extends Equatable{}

// class GameInitialState extends GameState {}
// class GameQuestionState extends GameState {
//   final String question;
//   final List<String> options;
//   final int randomImageIndex;

//   GameQuestionState(
//       {required this.question,
//       required this.options,
//       required this.randomImageIndex});
// }
// class GameResultState extends GameState {
//   final bool isCorrect;
//   final Fossil? fossil;

//   GameResultState({required this.isCorrect, this.fossil});
// }