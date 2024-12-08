import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:random_jokes_app/domain/models/joke_type.dart';
import 'package:random_jokes_app/services/joke_service.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  late final JokeService _jokeService;

  JokesBloc(JokeService? jokeService) : super(JokesInitial()) {
    _jokeService = jokeService ?? JokeService();
    on<JokeTypesInitialLoad>(_onJokeTypesInitialLoad);
    on<JokeSelected>(_onJokeSelect);
  }

  Future<void> _onJokeTypesInitialLoad(
    JokeTypesInitialLoad event,
    Emitter<JokesState> emit,
  ) async {
    try {
      emit(JokesLoadInProgress());
      final jokeTypes = await _jokeService.getJokeTypes();
      if (jokeTypes.isEmpty) {
        emit(JokeTypesLoadFailed());
      } else {
        emit(JokeTypesLoadSuccess(jokeTypes: jokeTypes));
      }
    } on Exception {
      emit(JokeTypesLoadFailed());
    } on Error {
      emit(JokeTypesLoadFailed());
    }
  }

  Future<void> _onJokeSelect(
    JokeSelected event,
    Emitter<JokesState> emit,
  ) async {
    emit(JokeTypeSelected(
      jokeType: event.joke,
    ));
  }
}
