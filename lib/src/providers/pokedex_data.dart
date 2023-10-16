part of com.devdennysegura.pokedex.providers;

class PokemonNotifier extends StateNotifier<List<Pokemon>> {
  PokemonNotifier() : super([]);

  String? nextPage;
  bool isLoading = false;

  Future<void> fetchPokemons([String? url]) async {
    if (isLoading) return;
    isLoading = true;
    try {
      PokedexPage? data;
      if (state.isEmpty) {
        data = await PokeApiService().getPokedex();
      } else if (nextPage != null) {
        data = await PokeApiService().getPokedexNextPage(nextPage!);
      }
      nextPage = data?.next;
      state = [...state, ...(data?.results ?? <Pokemon>[])];
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }
}

final pokemonProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>(
  (ref) => PokemonNotifier()..fetchPokemons(),
);

final nextPageProvider = Provider<String?>((ref) {
  return ref.watch(pokemonProvider.notifier).nextPage;
});
