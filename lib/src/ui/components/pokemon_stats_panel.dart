part of com.devdennysegura.pokedex.components;

class PokemonStatsPanel extends StatelessWidget {
  const PokemonStatsPanel(this.data, {super.key});
  final Pokemon data;

  List<String> get stats => data.stats.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PokemonStatRow(
              ReCase(stats[index].replaceFirst('-', ' ')).titleCase,
              statKey: stats[index],
              pokemon: data,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: data.stats.keys.length,
          ),
        ],
      ),
    );
  }
}
