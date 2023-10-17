part of com.devdennysegura.pokedex.components;

class PokemonInfoWeaknessRow extends StatelessWidget {
  const PokemonInfoWeaknessRow(this.data, {super.key});
  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Weakness',
                style: GoogleFonts.roboto().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromRGBO(170, 170, 170, 1)),
              ),
            ),
            SizedBox(
              width: constraint.maxWidth * 0.7,
              child: PokemonWeaknessBadge(data),
            )
          ],
        );
      },
    );
  }
}
