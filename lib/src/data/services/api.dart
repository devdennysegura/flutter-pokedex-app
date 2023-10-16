part of com.devdennysegura.pokedex.data.services;

class PokeApiService {
  final String _basePath = 'https://pokeapi.co/api/v2';

  Future<Pokemon> getPokemon(String name) async {
    final String url = '$_basePath/pokemon/$name';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al obtener el Pokémon: ${response.statusCode}');
    }
  }

//   https://pokeapi.co/api/v2/pokemon/
// https://pokeapi.co/api/v2/type/fire
// https://pokeapi.co/api/v2/pokemon/6/
// https://pokeapi.co/api/v2/pokemon-species/6/ > evolution_chain.url
// https://pokeapi.co/api/v2/evolution-chain/2/
// https://pokeapi.co/api/v2/gender/1/ > female
// https://pokeapi.co/api/v2/gender/2/ > male
}
