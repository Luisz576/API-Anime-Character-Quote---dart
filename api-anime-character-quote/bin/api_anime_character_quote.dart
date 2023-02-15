import 'package:api_anime_character_quote/api.dart';
import 'package:api_anime_character_quote/api_router.dart';

void main(List<String> arguments) {
  Api.create('0.0.0.0', 5760, ApiRouter()());
}