part of com.devdennysegura.pokedex.data.models;

class Pokemon with PokemonAttributesMixin {
  final String name;
  final int id;
  final String artworkUrl;
  final String photoUrl;
  final List<String> abilities;
  final Map<String, int> stats;
  final PokemonInfo info;
  final List<PokeTypes> types;
  final String? specieUrl;
  List<Pokemon?>? evolutionChain;

  Pokemon({
    required this.name,
    required this.id,
    required this.artworkUrl,
    required this.photoUrl,
    required this.abilities,
    required this.stats,
    required this.info,
    required this.types,
    required this.specieUrl,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : specieUrl = json['species']['url'],
        name = json['name'],
        id = json['id'],
        artworkUrl = json['sprites']['other']['home']['front_default'],
        photoUrl =
            json['sprites']['other']['official-artwork']['front_default'],
        abilities = (json['abilities'] as List)
            .map((e) => e['ability']['name'] as String)
            .toList(),
        stats = Map.fromEntries(
          (json['stats'] as List).map(
            (e) => MapEntry(
              e['stat']['name'] as String,
              e['base_stat'] as int,
            ),
          ),
        ),
        info = PokemonInfo(
          height: json['height'],
          weight: json['weight'],
          abilities: (json['abilities'] as List)
              .map((e) => e['ability']['name'] as String)
              .toList(),
        ),
        types = (json['types'] as List<dynamic>)
            .map(
              (dynamic type) =>
                  PokeTypes.fromString(type['type']['name'] as String),
            )
            .toList();

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  bool operator ==(Object other) => other is Pokemon && other.id == id;

  @override
  String toString() => ReCase(name).titleCase;
}
