import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

part 'index_skibo_event.dart';
part 'index_skibo_state.dart';

@injectable
class IndexSkiboBloc extends Bloc<IndexSkiboEvent, IndexSkiboState> {
  IndexSkiboBloc() : super(IndexNavInitial()) {
    on<IndexNavStarted>((event, emit) {
      emit(IndexNavLoading());
    });
    on<IndexSkiboChangedPage>((event, emit) async {
      emit(IndexNavLoading());
      emit(IndexNavSuccess());
    });
  }
}
