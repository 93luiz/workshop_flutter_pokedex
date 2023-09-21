import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_item.dart';
import 'package:pokedex/widgets/detalhar_page.dart';
import 'package:vy_string_utils/vy_string_utils.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonItem pokemon;

  const PokemonListItem(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(
          'assets/icons/pokeball.png',
          height: 28.0,
        ),
        title: Text(pokemon.nome.capitalizeAndLowercase()),
        tileColor: Colors.red.shade100,
        splashColor: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetalharPage(pokemon),
            ),
          );
        },
      ),
    );
  }
}
