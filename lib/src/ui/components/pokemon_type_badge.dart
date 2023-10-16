part of com.devdennysegura.pokedex.components;

class PokemonTypeBadge extends StatelessWidget {
  const PokemonTypeBadge(this.data, {super.key});
  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String fileUrl = 'assets/images/${data.types[index].name}.svg';
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Card(
              margin: EdgeInsets.zero,
              color: PokeTypeColor.type(data.types[index]).color,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      fileUrl,
                      height: 12,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      ReCase(data.types[index].name).titleCase,
                      style: GoogleFonts.roboto().copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: data.types.length,
      ),
    );
  }
}
