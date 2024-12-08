// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      id: json['id'] as String,
      jokeType: JokeType.fromJson(json['jokeType'] as Map<String, dynamic>),
      setup: json['setup'] as String,
      punchline: json['punchline'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'id': instance.id,
      'jokeType': instance.jokeType,
      'setup': instance.setup,
      'punchline': instance.punchline,
    };
