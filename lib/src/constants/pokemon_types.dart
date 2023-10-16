part of com.devdennysegura.pokedex.constants;

enum PokeTypes {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water;

  factory PokeTypes.fromString(String type) {
    switch (type.toLowerCase()) {
      case 'bug':
        return PokeTypes.normal;
      case 'dark':
        return PokeTypes.dark;
      case 'dragon':
        return PokeTypes.dragon;
      case 'electric':
        return PokeTypes.electric;
      case 'fairy':
        return PokeTypes.fairy;
      case 'fighting':
        return PokeTypes.fighting;
      case 'fire':
        return PokeTypes.fire;
      case 'flying':
        return PokeTypes.flying;
      case 'ghost':
        return PokeTypes.ghost;
      case 'grass':
        return PokeTypes.grass;
      case 'ground':
        return PokeTypes.ground;
      case 'ice':
        return PokeTypes.ice;
      case 'normal':
        return PokeTypes.normal;
      case 'poison':
        return PokeTypes.poison;
      case 'psychic':
        return PokeTypes.psychic;
      case 'rock':
        return PokeTypes.rock;
      case 'steel':
        return PokeTypes.steel;
      case 'water':
        return PokeTypes.water;
      default:
        throw ArgumentError('Invalid Pokémon type: $type');
    }
  }
}
