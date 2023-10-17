part of com.devdennysegura.pokedex.providers;

AutoDisposeFutureProviderFamily<List<Pokemon?>?, Pokemon>
    pokemonEvolutionChainProvider =
    FutureProvider.autoDispose.family<List<Pokemon?>?, Pokemon>(
  (ref, pokemon) => PokeApiService().getPokemonEvolutionChain(pokemon),
);
