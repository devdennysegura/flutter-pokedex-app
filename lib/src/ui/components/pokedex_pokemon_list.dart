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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addListener(pagination);
    });
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
      print('nuevos mas o menos');
      ref.read(pokemonProvider.notifier).fetchPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokemons = ref.watch(pokemonProvider);
    return ListView.separated(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Card(
          elevation: 5,
          child: SizedBox(
            height: 160,
            child: Center(child: Text(pokemons[index].name)),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 40),
      itemCount: pokemons.length,
    );
  }
}
