import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_fossilquest/collection/fossils.dart';
import 'package:game_fossilquest/collection/isar_service.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final IsarService isarService;

  CollectionBloc(this.isarService) : super(CollectionInitial()) {
    on<LoadCollectionEvent>((event, emit) async {
      emit(CollectionLoading());
      try {
        final fossils = await isarService.getFossils();
        emit(CollectionLoaded(fossils: fossils));
      } catch (e) {
        emit(CollectionError(message: 'Failed to load collection'));
      }
    });
  }
}
