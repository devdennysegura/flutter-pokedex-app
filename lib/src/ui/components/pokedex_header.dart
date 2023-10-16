part of com.devdennysegura.pokedex.components;

class PokedexHeader extends StatelessWidget {
  const PokedexHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ColoredBox(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: constraint.maxHeight,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Pokedex',
                  style: GoogleFonts.robotoFlex().copyWith(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: -70,
              child: SvgPicture.asset(
                'assets/images/pokeball-transparent.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(244, 244, 244, 1),
                  BlendMode.srcIn,
                ),
                height: 200,
              ),
            ),
          ],
        ),
      );
    });
  }
}
