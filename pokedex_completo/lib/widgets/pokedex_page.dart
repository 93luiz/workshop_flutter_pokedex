import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_item.dart';
import 'package:pokedex/services/poke_api.dart';
import 'package:pokedex/widgets/pokemon_list_item.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  Future<List<PokemonItem>> _getPokemon() async {
    final PokeApi pokeApi = context.read<PokeApi>();
    return await pokeApi.buscaPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
      ),
      body: FutureBuilder<List<PokemonItem>>(
        future: _getPokemon(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<PokemonItem> pokemon = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8.0),
            itemCount: pokemon.length,
            itemBuilder: (context, index) {
              final PokemonItem item = pokemon[index];
              return PokemonListItem(item);
            },
          );
        },
      ),
    );
  }
}
