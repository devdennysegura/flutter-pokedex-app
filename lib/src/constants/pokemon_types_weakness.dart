part of com.devdennysegura.pokedex.constants;

enum PokeWeakness {
  normal(<String>['fighting']),
  fire(<String>['water', 'ground', 'rock']),
  water(<String>['grass', 'electric']),
  grass(<String>['fire', 'ice', 'poison', 'flying', 'bug']),
  electric(<String>['ground']),
  ice(<String>['fire', 'fighting', 'rock', 'steel']),
  fighting(<String>['flying', 'psychic', 'fairy']),
  poison(<String>['ground', 'psychic']),
  ground(<String>['water', 'grass', 'ice']),
  flying(<String>['electric', 'ice', 'rock']),
  psychic(<String>['bug', 'ghost', 'dark']),
  bug(<String>['flying', 'rock', 'fire']),
  rock(<String>['water', 'grass', 'fighting', 'ground', 'steel']),
  ghost(<String>['ghost', 'dark']),
  dragon(<String>['ice', 'dragon', 'fairy']),
  dark(<String>['fighting', 'bug', 'fairy']),
  steel(<String>['fire', 'fighting', 'ground']),
  fairy(<String>['poison', 'steel']);

  final List<String> weakness;
  const PokeWeakness(this.weakness);

  static findPokemonWeakness(PokeTypes type) {
    switch (type) {
      case PokeTypes.bug:
        return PokeWeakness.normal;
      case PokeTypes.dark:
        return PokeWeakness.dark;
      case PokeTypes.dragon:
        return PokeWeakness.dragon;
      case PokeTypes.electric:
        return PokeWeakness.electric;
      case PokeTypes.fairy:
        return PokeWeakness.fairy;
      case PokeTypes.fighting:
        return PokeWeakness.fighting;
      case PokeTypes.fire:
        return PokeWeakness.fire;
      case PokeTypes.flying:
        return PokeWeakness.flying;
      case PokeTypes.ghost:
        return PokeWeakness.ghost;
      case PokeTypes.grass:
        return PokeWeakness.grass;
      case PokeTypes.ground:
        return PokeWeakness.ground;
      case PokeTypes.ice:
        return PokeWeakness.ice;
      case PokeTypes.normal:
        return PokeWeakness.normal;
      case PokeTypes.poison:
        return PokeWeakness.poison;
      case PokeTypes.psychic:
        return PokeWeakness.psychic;
      case PokeTypes.rock:
        return PokeWeakness.rock;
      case PokeTypes.steel:
        return PokeWeakness.steel;
      case PokeTypes.water:
        return PokeWeakness.water;
    }
  }

  @override
  String toString() => "The $name weak to $weakness.";
}
