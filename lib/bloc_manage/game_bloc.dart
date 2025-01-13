import 'package:bloc/bloc.dart';
import 'package:game_fossilquest/application/random_image.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(InitialState()) {
    // Registering event handlers
    on<StartGameEvent>(_onStartGame);
    on<TapImageEvent>(_onTapImage);
  }

  void _onStartGame(StartGameEvent event, Emitter<GameState> emit) {
    final images = List.generate(
      3,
      (index) => '../../assets/images/cracked.png',
    );
    emit(ImagesGenerated(images));
  }

  void _onTapImage(TapImageEvent event, Emitter<GameState> emit) {
    if (state is ImagesGenerated) {
      final currentState = state as ImagesGenerated;
      emit(ImageTappedOnce(currentState.images, event.index));
    } else if (state is ImageTappedOnce) {
      final currentState = state as ImageTappedOnce;
      emit(QuestionDisplayed(currentState.images, event.index));
    }
  }
}
