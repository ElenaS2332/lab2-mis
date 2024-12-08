import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:random_jokes_app/domain/models/joke_type.dart';

part 'joke.g.dart';

@JsonSerializable()
class Joke extends Equatable {
  final String id;
  final JokeType jokeType;
  final String setup;
  final String punchline;

  const Joke({
    required this.id,
    required this.jokeType,
    required this.setup,
    required this.punchline,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);

  @override
  List<Object?> get props => [id];
}
