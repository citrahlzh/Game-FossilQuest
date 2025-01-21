part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object?> get props => [];
}

class LoadCollectionEvent extends CollectionEvent {}

class AddFossilEvent extends CollectionEvent {
  final Fossil fossil;

  const AddFossilEvent(this.fossil);

  @override
  List<Object?> get props => [fossil];
}
