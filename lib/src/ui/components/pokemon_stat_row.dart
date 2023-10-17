part of com.devdennysegura.pokedex.components;

class PokemonStatRow extends StatelessWidget {
  const PokemonStatRow(
    this.title, {
    required this.pokemon,
    required this.statKey,
    super.key,
  });
  final String title;
  final String statKey;
  final Pokemon pokemon;

  num get progressMaxIndicator =>
      pokemon.maxStatPercentage(pokemon.stats[statKey]!);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        width: constraint.maxWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 65,
              child: Text(
                title,
                textAlign: TextAlign.end,
                style: GoogleFonts.roboto().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromRGBO(170, 170, 170, 1)),
              ),
            ),
            SizedBox(
              width: 70,
              child: Text(
                pokemon.stats[statKey].toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(90, 90, 90, 1),
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return LinearPercentIndicator(
                  width: constraints.maxWidth,
                  lineHeight: 6,
                  progressColor: PokeStatColor.stat(statKey).color,
                  barRadius: const Radius.elliptical(5, 10),
                  backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
                  percent: pokemon.stats[statKey]! / progressMaxIndicator,
                  animation: true,
                  animationDuration: 1400,
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
