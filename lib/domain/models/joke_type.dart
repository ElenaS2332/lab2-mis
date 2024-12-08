import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joke_type.g.dart';

@JsonSerializable()
class JokeType extends Equatable {
  final String type;

  const JokeType({required this.type});

  factory JokeType.fromJson(Map<String, dynamic> json) =>
      _$JokeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeTypeToJson(this);

  @override
  List<Object?> get props => [type];
}
