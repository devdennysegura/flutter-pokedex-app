part of com.devdennysegura.pokedex.data.models;

class PokedexPage {
  final int count;
  final String? next;
  final String? previous;
  List<Pokemon>? results;

  PokedexPage({
    required this.count,
    required this.next,
    required this.previous,
  });

  factory PokedexPage.fromJson(Map<String, dynamic> json) {
    return PokedexPage(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
    );
  }
}
