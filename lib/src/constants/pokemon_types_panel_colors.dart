part of com.devdennysegura.pokedex.constants;

enum PokePanelColor {
  bug(<Color>[
    Color.fromRGBO(79, 164, 90, 1),
    Color.fromRGBO(109, 189, 103, 1),
    Color.fromRGBO(189, 255, 166, 1),
  ]),
  dark(<Color>[
    Color.fromRGBO(67, 66, 100, 1),
    Color.fromRGBO(92, 91, 113, 1),
    Color.fromRGBO(147, 166, 176, 1),
  ]),
  dragon(<Color>[
    Color.fromRGBO(0, 80, 205, 1),
    Color.fromRGBO(11, 105, 218, 1),
    Color.fromRGBO(71, 180, 255, 1),
  ]),
  electric(<Color>[
    Color.fromRGBO(182, 153, 59, 1),
    Color.fromRGBO(212, 178, 72, 1),
    Color.fromRGBO(255, 253, 135, 1),
  ]),
  fairy(<Color>[
    Color.fromRGBO(173, 88, 174, 1),
    Color.fromRGBO(203, 113, 189, 1),
    Color.fromRGBO(255, 188, 234, 1),
  ]),
  fighting(<Color>[
    Color.fromRGBO(175, 23, 87, 1),
    Color.fromRGBO(205, 48, 100, 1),
    Color.fromRGBO(255, 123, 163, 1),
  ]),
  fire(<Color>[
    Color.fromRGBO(195, 98, 46, 1),
    Color.fromRGBO(225, 123, 59, 1),
    Color.fromRGBO(255, 198, 112, 1),
  ]),
  flying(<Color>[
    Color.fromRGBO(80, 108, 193, 1),
    Color.fromRGBO(105, 133, 206, 1),
    Color.fromRGBO(180, 208, 255, 1),
  ]),
  ghost(<Color>[
    Color.fromRGBO(54, 80, 186, 1),
    Color.fromRGBO(79, 105, 199, 1),
    Color.fromRGBO(154, 180, 255, 1),
  ]),
  grass(<Color>[
    Color.fromRGBO(79, 140, 112, 1),
    Color.fromRGBO(109, 165, 125, 1),
    Color.fromRGBO(189, 240, 178, 1),
  ]),
  ground(<Color>[
    Color.fromRGBO(187, 83, 55, 1),
    Color.fromRGBO(217, 108, 68, 1),
    Color.fromRGBO(255, 183, 121, 1),
  ]),
  ice(<Color>[
    Color.fromRGBO(47, 171, 156, 1),
    Color.fromRGBO(77, 196, 181, 1),
    Color.fromRGBO(157, 255, 236, 1),
  ]),
  normal(<Color>[
    Color.fromRGBO(137, 151, 194, 1),
    Color.fromRGBO(167, 176, 204, 1),
    Color.fromRGBO(247, 251, 255, 1),
  ]),
  poison(<Color>[
    Color.fromRGBO(139, 45, 207, 1),
    Color.fromRGBO(164, 70, 220, 1),
    Color.fromRGBO(239, 145, 255, 1),
  ]),
  psychic(<Color>[
    Color.fromRGBO(195, 70, 72, 1),
    Color.fromRGBO(225, 95, 97, 1),
    Color.fromRGBO(255, 170, 172, 1),
  ]),
  rock(<Color>[
    Color.fromRGBO(153, 150, 123, 1),
    Color.fromRGBO(183, 175, 136, 1),
    Color.fromRGBO(243, 230, 179, 1),
  ]),
  steel(<Color>[
    Color.fromRGBO(27, 96, 130, 1),
    Color.fromRGBO(52, 121, 155, 1),
    Color.fromRGBO(127, 196, 230, 1),
  ]),
  water(<Color>[
    Color.fromRGBO(38, 121, 226, 1),
    Color.fromRGBO(63, 146, 236, 1),
    Color.fromRGBO(138, 221, 255, 1),
  ]);

  final List<Color> colors;
  const PokePanelColor(this.colors);

  factory PokePanelColor.type(PokeTypes type) {
    switch (type) {
      case PokeTypes.bug:
        return PokePanelColor.normal;
      case PokeTypes.dark:
        return PokePanelColor.dark;
      case PokeTypes.dragon:
        return PokePanelColor.dragon;
      case PokeTypes.electric:
        return PokePanelColor.electric;
      case PokeTypes.fairy:
        return PokePanelColor.fairy;
      case PokeTypes.fighting:
        return PokePanelColor.fighting;
      case PokeTypes.fire:
        return PokePanelColor.fire;
      case PokeTypes.flying:
        return PokePanelColor.flying;
      case PokeTypes.ghost:
        return PokePanelColor.ghost;
      case PokeTypes.grass:
        return PokePanelColor.grass;
      case PokeTypes.ground:
        return PokePanelColor.ground;
      case PokeTypes.ice:
        return PokePanelColor.ice;
      case PokeTypes.normal:
        return PokePanelColor.normal;
      case PokeTypes.poison:
        return PokePanelColor.poison;
      case PokeTypes.psychic:
        return PokePanelColor.psychic;
      case PokeTypes.rock:
        return PokePanelColor.rock;
      case PokeTypes.steel:
        return PokePanelColor.steel;
      case PokeTypes.water:
        return PokePanelColor.water;
    }
  }
}
