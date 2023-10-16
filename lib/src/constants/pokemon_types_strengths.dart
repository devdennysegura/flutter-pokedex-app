part of com.devdennysegura.pokedex.constants;

enum PokeStrength {
  normal([]),
  fire(['bug', 'steel', 'grass', 'ice']),
  water(['fire', 'ground', 'rock']),
  grass(['water', 'ground', 'rock']),
  electric(['water', 'flying']),
  ice(['grass', 'ground', 'flying', 'dragon']),
  fighting(['normal', 'rock', 'steel', 'ice', 'dark']),
  poison(['grass', 'fairy']),
  ground(['fire', 'electric', 'poison', 'rock', 'steel']),
  flying(['grass', 'fighting', 'bug']),
  psychic(['fighting', 'poison']),
  bug(['grass', 'psychic', 'dark']),
  rock(['fire', 'ice', 'flying', 'bug']),
  ghost(['psychic', 'ghost']),
  dragon(['dragon']),
  dark(['psychic', 'ghost']),
  steel(['ice', 'rock', 'fairy']),
  fairy(['fighting', 'dragon', 'dark']);

  final List<String> strengths;
  const PokeStrength(this.strengths);

  static findPokemonStrengths(PokeTypes type) {
    switch (type) {
      case PokeTypes.bug:
        return PokeStrength.normal;
      case PokeTypes.dark:
        return PokeStrength.dark;
      case PokeTypes.dragon:
        return PokeStrength.dragon;
      case PokeTypes.electric:
        return PokeStrength.electric;
      case PokeTypes.fairy:
        return PokeStrength.fairy;
      case PokeTypes.fighting:
        return PokeStrength.fighting;
      case PokeTypes.fire:
        return PokeStrength.fire;
      case PokeTypes.flying:
        return PokeStrength.flying;
      case PokeTypes.ghost:
        return PokeStrength.ghost;
      case PokeTypes.grass:
        return PokeStrength.grass;
      case PokeTypes.ground:
        return PokeStrength.ground;
      case PokeTypes.ice:
        return PokeStrength.ice;
      case PokeTypes.normal:
        return PokeStrength.normal;
      case PokeTypes.poison:
        return PokeStrength.poison;
      case PokeTypes.psychic:
        return PokeStrength.psychic;
      case PokeTypes.rock:
        return PokeStrength.rock;
      case PokeTypes.steel:
        return PokeStrength.steel;
      case PokeTypes.water:
        return PokeStrength.water;
    }
  }

  @override
  String toString() => "The $name strong to $strengths.";
}
