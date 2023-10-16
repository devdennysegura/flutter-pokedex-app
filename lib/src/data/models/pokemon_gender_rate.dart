part of com.devdennysegura.pokedex.data.models;

class PokemonGenderRate {
  final String name;
  final int rate;
  String? genderName;

  PokemonGenderRate({required this.name, required this.rate});

  PokemonGenderRate.fromJson(Map<String, dynamic> json)
      : name = json['pokemon_species']['name'].split('-').first,
        rate = json['rate'];

  @override
  int get hashCode => name.hashCode ^ rate.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonGenderRate &&
        other.name == name &&
        other.rate == rate;
  }
}
