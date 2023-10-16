part of com.devdennysegura.pokedex.constants;

enum PokeStatColor {
  hp(Color.fromRGBO(104, 227, 168, 1)),
  attack(Color.fromRGBO(227, 104, 104, 1)),
  defense(Color.fromRGBO(255, 198, 113, 1)),
  specialAttack(Color.fromRGBO(227, 104, 104, 1)),
  specialDeffense(Color.fromRGBO(255, 198, 113, 1)),
  speed(Color.fromRGBO(113, 177, 255, 1));

  final Color color;
  const PokeStatColor(this.color);

  factory PokeStatColor.type(String statName) {
    switch (statName) {
      case 'hp':
        return PokeStatColor.hp;
      case 'attack':
        return PokeStatColor.attack;
      case 'defense':
        return PokeStatColor.defense;
      case 'special-attack':
        return PokeStatColor.specialAttack;
      case 'special-defense':
        return PokeStatColor.specialDeffense;
      case 'speed':
        return PokeStatColor.speed;
      default:
        throw ArgumentError('Invalid Pokémon stat: $statName');
    }
  }
}
