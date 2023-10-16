part of com.devdennysegura.pokedex.constants;

enum PokeTypeColor {
  normal(Color.fromRGBO(157, 160, 170, 1)),
  fighting(Color.fromRGBO(208, 65, 100, 1)),
  flying(Color.fromRGBO(116, 143, 201, 1)),
  poison(Color.fromRGBO(165, 82, 204, 1)),
  ground(Color.fromRGBO(221, 119, 72, 1)),
  rock(Color.fromRGBO(186, 171, 130, 1)),
  bug(Color.fromRGBO(140, 178, 48, 1)),
  ghost(Color.fromRGBO(85, 106, 174, 1)),
  steel(Color.fromRGBO(65, 125, 154, 1)),
  water(Color.fromRGBO(74, 144, 218, 1)),
  grass(Color.fromRGBO(98, 185, 87, 1)),
  electric(Color.fromRGBO(238, 213, 53, 1)),
  psychic(Color.fromRGBO(234, 93, 96, 1)),
  ice(Color.fromRGBO(97, 206, 192, 1)),
  dragon(Color.fromRGBO(15, 106, 192, 1)),
  dark(Color.fromRGBO(88, 87, 95, 1)),
  fire(Color.fromRGBO(253, 125, 36, 1)),
  fairy(Color.fromRGBO(237, 110, 199, 1));

  final Color color;
  const PokeTypeColor(this.color);

  factory PokeTypeColor.type(PokeTypes type) {
    switch (type) {
      case PokeTypes.bug:
        return PokeTypeColor.normal;
      case PokeTypes.dark:
        return PokeTypeColor.dark;
      case PokeTypes.dragon:
        return PokeTypeColor.dragon;
      case PokeTypes.electric:
        return PokeTypeColor.electric;
      case PokeTypes.fairy:
        return PokeTypeColor.fairy;
      case PokeTypes.fighting:
        return PokeTypeColor.fighting;
      case PokeTypes.fire:
        return PokeTypeColor.fire;
      case PokeTypes.flying:
        return PokeTypeColor.flying;
      case PokeTypes.ghost:
        return PokeTypeColor.ghost;
      case PokeTypes.grass:
        return PokeTypeColor.grass;
      case PokeTypes.ground:
        return PokeTypeColor.ground;
      case PokeTypes.ice:
        return PokeTypeColor.ice;
      case PokeTypes.normal:
        return PokeTypeColor.normal;
      case PokeTypes.poison:
        return PokeTypeColor.poison;
      case PokeTypes.psychic:
        return PokeTypeColor.psychic;
      case PokeTypes.rock:
        return PokeTypeColor.rock;
      case PokeTypes.steel:
        return PokeTypeColor.steel;
      case PokeTypes.water:
        return PokeTypeColor.water;
    }
  }
}
