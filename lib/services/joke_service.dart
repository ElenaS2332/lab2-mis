import 'package:random_jokes_app/domain/models/joke_type.dart';
import 'package:random_jokes_app/services/http_service.dart';

class JokeService {
  JokeService([HttpService? client]) {
    _client = client ?? HttpService();
  }

  late final HttpService _client;

  Future<List<JokeType>> getJokeTypes() async {
    final List response = await _client.get("types");
    return response
        // .map((c) => CategoryDto.fromJson(c))
        .map((j) => JokeType(type: j.type))
        .toList();
  }
}
