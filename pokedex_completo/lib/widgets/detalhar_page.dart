import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_detalhar.dart';
import 'package:pokedex/models/pokemon_item.dart';
import 'package:pokedex/services/poke_api.dart';
import 'package:pokedex/widgets/info_container.dart';
import 'package:pokedex/widgets/type.dart';
import 'package:provider/provider.dart';
import 'package:vy_string_utils/vy_string_utils.dart';

class DetalharPage extends StatefulWidget {
  const DetalharPage(this.pokemon, {super.key});

  final PokemonItem pokemon;

  @override
  State<DetalharPage> createState() => _DetalharPageState();
}

class _DetalharPageState extends State<DetalharPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokémon"),
      ),
      body: FutureBuilder(
        future: context.read<PokeApi>().detalharPokemon(widget.pokemon),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final PokemonDetalhar pokemon = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              InfoContainer(
                child: Image.network(pokemon.urlSprite),
              ),
              const SizedBox(height: 8.0),
              InfoContainer(
                child: Text(
                  "#${pokemon.id}: ${pokemon.nome.capitalizeAndLowercase()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              InfoContainer(
                child: Row(
                  children: pokemon.tipos.map((e) => Type(e)).toList(),
                ),
              ),
              const SizedBox(height: 8.0),
              InfoContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Altura: ${pokemon.altura}cm",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Peso: ${pokemon.peso}g",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
