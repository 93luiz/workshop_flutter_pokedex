import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokedex_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PokedexPage(),
    );
  }
}