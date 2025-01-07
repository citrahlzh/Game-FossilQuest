import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:game_fossilquest/collection/fossils.dart';
import 'package:game_fossilquest/application/fossil.dart';
import 'package:game_fossilquest/application/question.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  List<Fossil> fossils;
  List<Question> questions;
  late Isar isar;

  GameBloc() {
    on<StartGameEvent>(_onStartGame);
    // on<AnswerQuestionEvent>(_onAnswerQuestion);
    // on<CollectFossilEvent>(_onCollectFossil);
    // _initDatabase();
  }

  Future<void> _initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([FossilSchema], directory: dir.path);
  }
}

void _onStartGame(StartGameEvent event, Emitter<GameState> emit) {
  final random = Random();

}

// class GameBloc extends Bloc<GameEvent, GameState> {
//   final List<Fossil> fossils;
//   final List<Question> questions;
//   late Isar isar;

//   GameBloc({required this.fossils, required this.questions}) : super(GameInitialState()) {
//     on<StartGameEvent>(_onStartGame);
//     on<AnswerQuestionEvent>(_onAnswerQuestion);
//     on<CollectFossilEvent>(_onCollectFossil);
//     _initDatabase();
//   }

//   Future<void> _initDatabase() async {
//     final dir = await getApplicationDocumentsDirectory();
//     isar = await Isar.open([FossilSchema], directory: dir.path);
//   }

//   void _onStartGame(StartGameEvent event, Emitter<GameState> emit) {
//     final random = Random();
//     final randomImageIndex = random.nextInt(fossils.length);
//     final randomQuestionIndex = random.nextInt(questions.length);

//     final question = questions[randomQuestionIndex];

//     emit(GameQuestionState(
//         question: question.question,
//         options: question.options,
//         randomImageIndex: randomImageIndex));
//   }

//   void _onAnswerQuestion(AnswerQuestionEvent event, Emitter<GameState> emit) {
//     final currentState = state;

//     if (currentState is GameQuestionState) {
//       final question = questions.firstWhere((q) => q.question == currentState.question);

//       if (event.answer == question.correctAnswer) {
//         final randomFossil = fossils[Random().nextInt(fossils.length)];
//         emit(GameResultState(isCorrect: true, fossil: randomFossil));
//       } else {
//         emit(GameResultState(isCorrect: false));
//       }
//     }
//   }

//   void _onCollectFossil(CollectFossilEvent event, Emitter<GameState> emit) async {
//     await isar.writeTxn(() async {
//       await isar.fossils.put(FossilIsar(
//         name: event.fossil.name,
//         description: event.fossil.description,
//         imagePath: '' // Update with proper image handling
//       ));
//     });
//     emit(GameInitialState());
//   }
// }
