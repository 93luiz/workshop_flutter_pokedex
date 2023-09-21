import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_detalhar.dart';
import 'package:pokedex/models/pokemon_item.dart';

class PokeApi {
  final Dio dio;

  PokeApi({
    required this.dio,
  });

  Future<List<PokemonItem>> buscaPokemon() async {
    final Response response = await dio.get('/pokemon');

    final List results = response.data['results'];

    return results.map((e) => PokemonItem.fronJson(e)).toList();
  }

  Future<PokemonDetalhar> detalharPokemon(PokemonItem pokemon) async {
    try {
      final Response response = await dio.get(pokemon.url);

      final Map<String, dynamic> result = response.data;

      return PokemonDetalhar.fronJson(result);
    } catch (e) {
      rethrow;
    }
  }
}
