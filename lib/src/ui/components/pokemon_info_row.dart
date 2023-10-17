part of com.devdennysegura.pokedex.components;

class PokemonInfoRow extends StatelessWidget {
  const PokemonInfoRow(this.title, this.value, {super.key});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.roboto().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromRGBO(170, 170, 170, 1)),
            ),
          ),
          SizedBox(
            width: constraint.maxWidth * 0.7,
            child: Text(
              value,
              style: GoogleFonts.roboto().copyWith(
                fontSize: 16,
                color: const Color.fromRGBO(90, 90, 90, 1),
              ),
            ),
          )
        ],
      );
    });
  }
}
