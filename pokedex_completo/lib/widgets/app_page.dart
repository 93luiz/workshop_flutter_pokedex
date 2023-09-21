import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/services/poke_api.dart';
import 'package:pokedex/widgets/pokedex_page.dart';
import 'package:provider/provider.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Dio _createDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
    ));

    return dio;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => PokeApi(dio: _createDio()),
      child: MaterialApp(
        home: const PokedexPage(),
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
      ),
    );
  }
}
