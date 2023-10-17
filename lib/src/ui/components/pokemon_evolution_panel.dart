part of com.devdennysegura.pokedex.components;

class PokemonEvolutionPanel extends ConsumerWidget {
  const PokemonEvolutionPanel(this.data, {super.key});
  final Pokemon data;

  List<String> get stats => data.stats.keys.toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Pokemon?>?> evolutionProvider =
        ref.watch(pokemonEvolutionChainProvider(data));
    return evolutionProvider.when(
      data: (data) {
        return SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...(data ?? <Pokemon?>[])
                  .map(
                    (e) => e == null
                        ? const SizedBox(
                            width: 50,
                            child: Center(
                              child: Icon(Icons.arrow_right_alt),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(e.artworkUrl, height: 80),
                              Text(e.name),
                            ],
                          ),
                  )
                  .toList()
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const SizedBox.shrink();
      },
      loading: () => SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: const LoadingIndicator(),
      ),
    );
  }
}
