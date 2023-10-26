part of 'index_skibo_bloc.dart';

abstract class IndexSkiboEvent extends Equatable {
  const IndexSkiboEvent();

  @override
  List<Object> get props => [];
}

class IndexNavStarted extends IndexSkiboEvent {}

class IndexNavGoAppBar extends IndexSkiboEvent {}

class IndexSkiboChangedPage extends IndexSkiboEvent {
  final int index;

  const IndexSkiboChangedPage({required this.index});

  @override
  List<Object> get props => [index];
}
