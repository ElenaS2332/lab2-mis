part of 'jokes_bloc.dart';

@immutable
sealed class JokesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class JokesInitial extends JokesState {}

final class JokesLoadSuccess extends JokesState {}

final class JokesLoadFailed extends JokesState {}

final class JokesLoadInProgress extends JokesState {}

final class JokeTypesLoadInProgress extends JokesState {}

final class JokeTypesLoadSuccess extends JokesState {
  final List<JokeType> jokeTypes;

  JokeTypesLoadSuccess({required this.jokeTypes});

  @override
  List<Object?> get props => [jokeTypes];
}

final class JokeTypesLoadFailed extends JokesState {}

final class JokeTypeSelected extends JokesState {
  final JokeType jokeType;

  JokeTypeSelected({required this.jokeType});

  @override
  List<Object?> get props => [jokeType.type];
}
