part of com.devdennysegura.pokedex.data.services;

class PokeApiService {
  final String _basePath = 'https://pokeapi.co/api/v2';

  Future<PokedexPage> getPokedex() async {
    final String url = '$_basePath/pokemon/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> rawResponse =
          jsonDecode(response.body) as Map<String, dynamic>;
      PokedexPage pokedex = PokedexPage.fromJson(rawResponse);
      List<Map<String, dynamic>> rawResults =
          rawResponse['results'] as List<Map<String, dynamic>>;
      pokedex.results = await Future.wait(
        rawResults.map(
          (result) => getPokemon(
            result['url'].toString().replaceFirst(url, ''),
          ),
        ),
      );
      return pokedex;
    } else {
      throw Exception('Error al obtener el Pokedex: ${response.statusCode}');
    }
  }

  Future<Pokemon> getPokemon(String name) async {
    final String url = '$_basePath/pokemon/$name';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al obtener el Pokémon: ${response.statusCode}');
    }
  }

  Future<List<Pokemon?>?> getPokemonEvolutionChain(Pokemon pokemon) async {
    if (pokemon.evolutionChain != null) {
      return pokemon.evolutionChain;
    } else if (pokemon.specieUrl != null) {
      final specieResponse = await http.get(Uri.parse(pokemon.specieUrl!));
      Map<String, dynamic> specieRawResponse = jsonDecode(specieResponse.body);
      if (specieRawResponse['evolution_chain'] != null) {
        final String url = specieRawResponse['evolution_chain']['url'];
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          Map<String, dynamic> chain = jsonDecode(response.body);
          List<String?> evolutionChain = pokemon.mapEvolves(chain);
          List<Future<Pokemon?>> evolutionFuture = evolutionChain
              .map((String? name) =>
                  name != null ? getPokemon(name) : Future.value(null))
              .toList();
          List<Pokemon?> data = await Future.wait(evolutionFuture);
          pokemon.evolutionChain = List<Pokemon?>.from(data);
          return data;
        } else {
          throw Exception(
              'Error al obtener la de cadena de evolución del Pokémon: ${pokemon.name}');
        }
      }
    }
    return null;
  }

  Future<dynamic> getCombinedPokemonGender() async {
    var (female, male) = await _getPokemonGenders();
    List<PokemonGenderRate> genders = [...female, ...male];
    final Map<String, List<PokemonGenderRate>> groupedMap = {};
    final Map<String, Map<String, dynamic>> result = {};
    for (var pokemon in genders) {
      if (!groupedMap.containsKey(pokemon.name)) {
        groupedMap[pokemon.name] = [];
      }
      groupedMap[pokemon.name]!.add(pokemon);
    }
    groupedMap.forEach((key, value) {
      PokemonGenderRate? female = value.firstWhereOrNull(
        (element) => element.genderName == 'female',
      );
      PokemonGenderRate? male = value.firstWhereOrNull(
        (element) => element.genderName == 'male',
      );
      result[key] = genderCalculator(female?.rate ?? 0, male?.rate ?? 0);
    });
    return result;
  }

  Future<(List<PokemonGenderRate> x, List<PokemonGenderRate> y)>
      _getPokemonGenders() async {
    List<List<PokemonGenderRate>> genders = await Future.wait(
        [_getPokemonGender('female'), _getPokemonGender('male')]);
    return (genders[0], genders[1]);
  }

  Future<List<PokemonGenderRate>> _getPokemonGender(String genderName) async {
    final String url = '$_basePath/gender/$genderName';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['pokemon_species_details']
              as List<dynamic>)
          .map((e) => PokemonGenderRate.fromJson(e as Map<String, dynamic>)
            ..genderName = genderName)
          .toList();
    } else {
      throw Exception('Error al obtener el Pokémon: ${response.statusCode}');
    }
  }

// https://pokeapi.co/api/v2/type/fire
}
