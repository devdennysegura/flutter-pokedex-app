part of com.devdennysegura.pokedex.views;

class PokemonPage extends ConsumerStatefulWidget {
  const PokemonPage(this.data, {super.key});
  final Pokemon data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> {
  late List<Item> items;

  @override
  void initState() {
    List<Color> colors = PokePanelColor.type(widget.data.types.first).colors;
    items = <Item>[
      Item(
        title: 'Info',
        icon: Icons.info,
        content: PokemonInfoPanel(widget.data),
        color: colors.first,
        isExpanded: true,
      ),
      Item(
        title: 'Stats & Breed',
        icon: Icons.bar_chart,
        content: PokemonStatsPanel(widget.data),
        color: colors[1],
      ),
      Item(
        title: 'Evolution',
        icon: Icons.trending_up,
        content: PokemonEvolutionPanel(widget.data),
        color: colors.last,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokeColor.type(widget.data.types.first).color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/pokeball-transparent.svg',
                        colorFilter: const ColorFilter.mode(
                          Color.fromRGBO(255, 255, 255, 0.11),
                          BlendMode.srcIn,
                        ),
                        height: 300,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: Hero(
                          tag: widget.data.name,
                          child: Image.network(
                            widget.data.artworkUrl,
                            height: 200.0,
                            width: 200.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          ReCase(widget.data.name).titleCase,
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Center(child: PokemonTypeBadge(widget.data)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 300, maxHeight: 500),
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return SizedBox(
                    height: constraint.maxHeight,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        PokemonDetailExpandableCard(items.first, onTap: () {
                          items[1].isExpanded = false;
                          items[2].isExpanded = false;
                          setState(() {});
                        }),
                        Positioned(
                          top: 54 + (items.first.isExpanded ? 250 : 0),
                          child:
                              PokemonDetailExpandableCard(items[1], onTap: () {
                            items[0].isExpanded = false;
                            items[2].isExpanded = false;
                            setState(() {});
                          }),
                        ),
                        Positioned(
                          top: 108 +
                              (items.first.isExpanded
                                  ? 250
                                  : items[1].isExpanded
                                      ? 320
                                      : 0),
                          child: PokemonDetailExpandableCard(items.last,
                              onTap: () {
                            items[0].isExpanded = false;
                            items[1].isExpanded = false;
                            setState(() {});
                          }),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
