// statefullW

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_detalhar.dart';

class DetalharPage extends StatefulWidget {
  const DetalharPage({
    required this.url,
    super.key,
  });

  final String url;

  @override
  State<DetalharPage> createState() => _DetalharPageState();
}

class _DetalharPageState extends State<DetalharPage> {
  Future<PokemonDetalhar> buscaPokemon() async {
    final Dio dio = Dio();
    final Response response = await dio.get(widget.url);
    final Map json = response.data;

    final PokemonDetalhar pokemon = PokemonDetalhar(
      nome: json["name"],
      id: json["id"],
      altura: json["height"],
      peso: json["weight"],
      urlImagem: json["sprites"]["other"]["official-artwork"]["front_default"],
    );

    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokémon"),
      ),
      body: FutureBuilder(
        future: buscaPokemon(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final PokemonDetalhar pokemon = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(pokemon.urlImagem),
                Text(
                  "#${pokemon.id} ${pokemon.nome}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
