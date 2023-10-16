part of com.devdennysegura.pokedex.components;

class PokemonCard extends StatelessWidget {
  final Pokemon data;
  const PokemonCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        height: 160,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 5,
                color: PokeColor.type(data.types.first).color,
                child: SizedBox(
                  height: 126,
                  width: constraint.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 11,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 8),
                        Text(
                          data.formattedNumber,
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 14.4,
                            fontWeight: FontWeight.w800,
                            color: const Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        ),
                        Text(
                          ReCase(data.name).titleCase,
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 24.375,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        PokemonTypeBadge(data),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: -30,
              child: SvgPicture.asset(
                'assets/images/pokeball-transparent.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(255, 255, 255, 0.11),
                  BlendMode.srcIn,
                ),
                height: 160,
              ),
            ),
            Positioned(
              top: 0,
              right: 16,
              child: Image.network(data.photoUrl, height: 150),
            ),
          ],
        ),
      );
    });
  }
}
