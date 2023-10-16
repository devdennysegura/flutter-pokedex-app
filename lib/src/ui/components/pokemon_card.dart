part of com.devdennysegura.pokedex.components;

class PokemonCard extends StatelessWidget {
  final Pokemon data;
  const PokemonCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 160,
          child: Center(child: Text(data.name)),
        ),
      ),
    );
  }
}
