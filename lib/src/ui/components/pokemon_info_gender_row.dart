part of com.devdennysegura.pokedex.components;

class PokemonInfoGendersRow extends ConsumerWidget {
  const PokemonInfoGendersRow(this.data, {super.key});
  final Pokemon data;

  Widget _genderLine(IconData icon, String percentage, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 5),
        Text(percentage, style: TextStyle(fontSize: 16, color: color)),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, Map<String, String>>? genders =
        ref.read(pokemonGendersProvider).value;
    if (genders != null) {
      Map<String, String>? pokemonGenders = genders[data.name];
      return LayoutBuilder(builder: (context, constraint) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Genders',
                style: GoogleFonts.roboto().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color.fromRGBO(170, 170, 170, 1),
                ),
              ),
            ),
            SizedBox(
              width: constraint.maxWidth * 0.7,
              child: Row(
                children: [
                  if (pokemonGenders != null &&
                      pokemonGenders['male'] != null) ...[
                    _genderLine(
                        Icons.male, pokemonGenders['male']!, AppColors.male),
                    const SizedBox(width: 16),
                  ],
                  if (pokemonGenders != null &&
                      pokemonGenders['female'] != null)
                    _genderLine(Icons.female, pokemonGenders['female']!,
                        AppColors.female),
                ],
              ),
            )
          ],
        );
      });
    }
    return const SizedBox.shrink();
  }
}
