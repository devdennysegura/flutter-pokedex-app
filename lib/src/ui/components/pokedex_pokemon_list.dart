part of com.devdennysegura.pokedex.components;

class PokedexPokemonList extends ConsumerStatefulWidget {
  const PokedexPokemonList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokedexPokemonListState();
}

class _PokedexPokemonListState extends ConsumerState<PokedexPokemonList> {
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(pagination);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(pagination);
    super.dispose();
  }

  void pagination() {
    if (controller.position.pixels / controller.position.maxScrollExtent >
        0.7) {
      ref.read(pokemonProvider.notifier).fetchPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokemons = ref.watch(pokemonProvider);
    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.only(bottom: 40),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PokemonCard(pokemons[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: pokemons.length,
    );
  }
}
