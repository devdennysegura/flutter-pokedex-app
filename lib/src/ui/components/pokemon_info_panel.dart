part of com.devdennysegura.pokedex.components;

class PokemonInfoPanel extends StatelessWidget {
  const PokemonInfoPanel(this.data, {super.key});
  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PokemonInfoRow('Height', data.info.formattedHeight),
          const SizedBox(height: 16),
          PokemonInfoRow('Weight', data.info.formattedWeight),
          const SizedBox(height: 16),
          PokemonInfoRow(
              'Abilities',
              data.info.abilities
                  .map(
                    (e) => ReCase(e).titleCase,
                  )
                  .join(', ')),
          const SizedBox(height: 16),
          PokemonInfoWeaknessRow(data),
          const SizedBox(height: 16),
          PokemonInfoGendersRow(data),
        ],
      ),
    );
  }
}
