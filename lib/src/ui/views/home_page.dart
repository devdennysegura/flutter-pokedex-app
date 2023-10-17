part of com.devdennysegura.pokedex.views;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Widget get img =>
      SvgPicture.asset('assets/images/pokeball-transparent.svg', height: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PokemonNotifier provider = ref.watch(pokemonProvider.notifier);
    List<Pokemon> pokemons = ref.watch(pokemonProvider);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: PokedexHeader(),
      ),
      backgroundColor: Colors.white,
      body: pokemons.isEmpty && provider.isLoading
          ? const LoadingIndicator()
          : const PokedexPokemonList(),
    );
  }
}
