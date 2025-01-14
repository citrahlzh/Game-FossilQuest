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

class OnSecondTapImageEvent extends GameEvent {
  final int index;
  
  OnSecondTapImageEvent({required this.index});
}