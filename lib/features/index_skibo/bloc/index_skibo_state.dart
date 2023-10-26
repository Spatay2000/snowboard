part of 'index_skibo_bloc.dart';

abstract class IndexSkiboState extends Equatable {
  const IndexSkiboState();

  @override
  List<Object> get props => [];
}

class IndexNavInitial extends IndexSkiboState {}

class IndexNavLoading extends IndexSkiboState {}

class IndexNavFailure extends IndexSkiboState {}

class IndexNavSuccess extends IndexSkiboState {}
