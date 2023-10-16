part of com.devdennysegura.pokedex.providers;

FutureProvider<Map<String, Map<String, String>>> pokemonGendersProvider =
    FutureProvider(
  (ref) => PokeApiService().getCombinedPokemonGender(),
);
