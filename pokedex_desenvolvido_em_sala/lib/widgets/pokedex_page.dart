// snipet: 'statefulW'

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_item.dart';
import 'package:pokedex/widgets/detalhar_page.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {

  Future<List<PokemonItem>> buscaPokemon() async {
    final Dio dio = Dio();

    final Response response = await dio.get("https://pokeapi.co/api/v2/pokemon");
    final List json = response.data["results"];
    final List<PokemonItem> list = json.map((e) => PokemonItem(
      nome: e["name"],
      url: e["url"],
    ))
    .toList();

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: FutureBuilder(
        future: buscaPokemon(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<PokemonItem> pokemonList = snapshot.data!;
          return ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final PokemonItem pokemon = pokemonList[index];
              return ListTile(
                title: Text(pokemon.nome),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetalharPage(url: pokemon.url),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}