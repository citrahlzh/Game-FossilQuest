import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../database/app_database.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final AppDatabase database;

  CollectionBloc(this.database) : super(CollectionInitial()) {
    on<LoadCollectionEvent>((event, emit) async {
      emit(CollectionLoading());
      try {
        final fossils = await database.getAllFossils();
        emit(CollectionLoaded(fossils: fossils));
      } catch (e) {
        emit(CollectionError(message: 'Failed to load collection'));
      }
    });

    on<AddFossilEvent>((event, emit) async {
      try {
        await database.insertFossil(event.fossil);
        add(LoadCollectionEvent());
      } catch (e) {
        emit(CollectionError(message: 'Failed to add fossil'));
      }
    });
  }
}