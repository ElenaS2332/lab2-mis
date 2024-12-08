part of 'jokes_bloc.dart';

@immutable
sealed class JokesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class JokeSelected extends JokesEvent {
  final JokeType joke;

  JokeSelected({required this.joke});

  @override
  List<Object?> get props => [joke.type];
}

class JokeTypesInitialLoad extends JokesEvent {
  JokeTypesInitialLoad();
}
