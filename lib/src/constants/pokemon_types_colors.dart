part of com.devdennysegura.pokedex.constants;

enum PokeColor {
  bug(Color.fromRGBO(139, 214, 116, 1)),
  dark(Color.fromRGBO(117, 116, 126, 1)),
  dragon(Color.fromRGBO(21, 130, 231, 1)),
  electric(Color.fromRGBO(242, 203, 85, 1)),
  fairy(Color.fromRGBO(233, 138, 204, 1)),
  fighting(Color.fromRGBO(235, 73, 113, 1)),
  fire(Color.fromRGBO(255, 148, 72, 1)),
  flying(Color.fromRGBO(130, 158, 219, 1)),
  ghost(Color.fromRGBO(104, 130, 212, 1)),
  grass(Color.fromRGBO(139, 190, 138, 1)),
  ground(Color.fromRGBO(247, 133, 81, 1)),
  ice(Color.fromRGBO(107, 221, 206, 1)),
  normal(Color.fromRGBO(197, 201, 214, 1)),
  poison(Color.fromRGBO(189, 95, 233, 1)),
  psychic(Color.fromRGBO(255, 120, 122, 1)),
  rock(Color.fromRGBO(213, 200, 149, 1)),
  steel(Color.fromRGBO(77, 146, 180, 1)),
  water(Color.fromRGBO(88, 171, 246, 1));

  final Color color;
  const PokeColor(this.color);

  factory PokeColor.type(PokeTypes type) {
    switch (type) {
      case PokeTypes.bug:
        return PokeColor.normal;
      case PokeTypes.dark:
        return PokeColor.dark;
      case PokeTypes.dragon:
        return PokeColor.dragon;
      case PokeTypes.electric:
        return PokeColor.electric;
      case PokeTypes.fairy:
        return PokeColor.fairy;
      case PokeTypes.fighting:
        return PokeColor.fighting;
      case PokeTypes.fire:
        return PokeColor.fire;
      case PokeTypes.flying:
        return PokeColor.flying;
      case PokeTypes.ghost:
        return PokeColor.ghost;
      case PokeTypes.grass:
        return PokeColor.grass;
      case PokeTypes.ground:
        return PokeColor.ground;
      case PokeTypes.ice:
        return PokeColor.ice;
      case PokeTypes.normal:
        return PokeColor.normal;
      case PokeTypes.poison:
        return PokeColor.poison;
      case PokeTypes.psychic:
        return PokeColor.psychic;
      case PokeTypes.rock:
        return PokeColor.rock;
      case PokeTypes.steel:
        return PokeColor.steel;
      case PokeTypes.water:
        return PokeColor.water;
    }
  }

  // @override
  // String toString() => "The $name water is $tempInFahrenheit F.";
}
