part of com.devdennysegura.pokedex.data.mixin;

mixin PokemonAttributesMixin {
  List<String> weakness(List<PokeTypes> types) {
    List<String> weaknesses = [];
    List<String> strengths = [];
    for (PokeTypes type in types) {
      weaknesses.addAll(PokeWeakness.findPokemonWeakness(type).weakness);
    }
    weaknesses = weaknesses.toSet().toList();
    for (PokeTypes type in types) {
      strengths.add(PokeStrength.findPokemonStrengths(type).name);
    }
    weaknesses.removeWhere((weakness) => strengths.contains(weakness));
    return weaknesses;
  }

  List<String?> mapEvolves(Map<String, dynamic> chain) {
    List<String?> result = [];
    result.add(chain['species']['name']);
    if (chain['evolves_to'] != null && chain['evolves_to'].isNotEmpty) {
      result.add(null);
      for (var evolucion in chain['evolves_to']) {
        var data = mapEvolves(evolucion);
        result.addAll(data);
      }
    }
    return result;
  }

  double maxStatPercentage(num baseStat) {
    return ((baseStat * 2 + 0 + 0) * (100 / 100) + 5) * 0.9;
  }
}
