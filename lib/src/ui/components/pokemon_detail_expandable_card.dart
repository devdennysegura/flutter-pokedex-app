part of com.devdennysegura.pokedex.components;

class PokemonDetailExpandableCard extends StatelessWidget {
  const PokemonDetailExpandableCard(this.item,
      {required this.onTap, super.key});
  final Item item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          item.isExpanded = !item.isExpanded;
          onTap();
        },
        child: Column(
          children: [
            Container(
              height: 64,
              width: MediaQuery.of(context).size.width,
              foregroundDecoration: !item.isExpanded
                  ? BoxDecoration(color: Colors.black.withOpacity(0.1))
                  : null,
              decoration: BoxDecoration(
                color: item.isExpanded ? Colors.white : item.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: item.isExpanded ? Colors.black : Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      item.icon,
                      size: 30,
                      color: item.isExpanded ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (item.isExpanded)
              ColoredBox(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 24),
                    item.content,
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
