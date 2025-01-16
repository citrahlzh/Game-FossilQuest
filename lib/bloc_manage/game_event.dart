part of 'game_bloc.dart';

abstract class GameEvent {}

class StartGameEvent extends GameEvent {
  final double screenWidth;
  final double screenHeight;

  StartGameEvent({required this.screenWidth, required this.screenHeight});

  List<Object?> get props => [screenWidth, screenHeight];
}

class OnTapImageEvent extends GameEvent {
  final int index;
  
  OnTapImageEvent({required this.index});
}

class ShowQuestionEvent extends GameEvent {
  final Question question;

  ShowQuestionEvent(this.question);
}

class SelectAnswerEvent extends GameEvent {
  final String selectedOption;

  SelectAnswerEvent(this.selectedOption);
}

class ShowResultEvent extends GameEvent {
  final bool isCorrect;

  ShowResultEvent(this.isCorrect);
}
