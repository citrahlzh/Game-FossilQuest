part of 'collection_bloc.dart';

abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionLoaded extends CollectionState {
  final List<FossilData> fossils;

  const CollectionLoaded({required this.fossils});

  @override
  List<Object> get props => [fossils];
}

class CollectionError extends CollectionState {
  final String message;

  const CollectionError({required this.message});

  @override
  List<Object> get props => [message];
}
