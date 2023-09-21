class PokemonItem {
  final String nome;
  final String url;

  PokemonItem({
    required this.nome,
    required this.url,
  });

  PokemonItem.fronJson(Map<String, dynamic> json)
      : nome = json['name'],
        url = json['url'];
}
