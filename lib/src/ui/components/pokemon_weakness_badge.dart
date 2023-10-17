part of com.devdennysegura.pokedex.components;

class PokemonWeaknessBadge extends StatelessWidget {
  const PokemonWeaknessBadge(this.data, {super.key});
  final Pokemon data;

  List<PokeTypes> get weakness =>
      data.weakness(data.types).map(PokeTypes.fromString).toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Card(
              margin: EdgeInsets.zero,
              color: PokeTypeColor.type(weakness[index]).color,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Text(
                  ReCase(weakness[index].name).titleCase,
                  style: GoogleFonts.roboto().copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: weakness.length,
      ),
    );
  }
}
