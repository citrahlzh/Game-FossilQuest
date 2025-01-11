part of 'game_bloc.dart';

abstract class GameEvent {}

class StartGameEvent extends GameEvent {}

class TapImageEvent extends GameEvent {
  final int index;
  
  TapImageEvent({required this.index});
}