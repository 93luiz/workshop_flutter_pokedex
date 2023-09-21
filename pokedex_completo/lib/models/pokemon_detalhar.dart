class PokemonDetalhar {
  final int id;
  final String nome;
  final int altura;
  final int peso;
  final List<String> tipos;
  final String urlSprite;

  PokemonDetalhar({
    required this.nome,
    required this.id,
    required this.altura,
    required this.peso,
    required this.tipos,
    required this.urlSprite,
  });

  PokemonDetalhar.fronJson(Map<String, dynamic> json)
      : nome = json['name'],
        id = json['id'],
        altura =
            json['height'] * 10, // multiplicando por 10 para transformar em cm
        peso =
            json['weight'] * 100, // multiplicando por 100 para transformar em g
        tipos = (json['types'] as List)
            .map((e) => e['type']['name'] as String)
            .toList(),
        urlSprite =
            json['sprites']['other']['official-artwork']['front_default'];
}
