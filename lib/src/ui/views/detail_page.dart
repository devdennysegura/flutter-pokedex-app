part of com.devdennysegura.pokedex.views;

class PokemonPage extends ConsumerStatefulWidget {
  const PokemonPage(this.data, {super.key});
  final Pokemon data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonPageState();
}

class _PokemonPageState extends ConsumerState<PokemonPage> {
  late List<Item> items;
  bool _isExpanded = false;

  @override
  void initState() {
    items = generateItems(
      PokeTypeColor.type(widget.data.types.first).color,
      3,
    );
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Positioned(
                // top: 0,
                // right: -30,
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
          const SizedBox(height: 20.0),
          // Expanded(
          //   child: LayoutBuilder(builder: (context, constraints) {
          //     return SizedBox(
          //       height: constraints.maxHeight,
          //       child: Column(
          //         children: [
          //           _buildExpandableBox(title: 'Info', isExpanded: _isExpanded),
          //         ],
          //       ),
          //     );
          //   }),
          // ),
          GestureDetector(
            onTap: () => setState(() {
              _isExpanded = !_isExpanded;
            }),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(_isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                  if (_isExpanded) ...[
                    const SizedBox(height: 24),
                    PokemonStatsPanel(widget.data),
                    // PokemonInfoPanel(widget.data),
                  ]
                ],
              ),
            ),
          ),

          // ExpansionPanelList(
          //   expansionCallback: (int index, bool isExpanded) {
          //     setState(() {
          //       // _isExpanded = !isExpanded;
          //     });
          //   },
          //   children: [
          //     ExpansionPanel(
          //       headerBuilder: (BuildContext context, bool isExpanded) {
          //         return ListTile(
          //           title: Text("Info"),
          //         );
          //       },
          //       body: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 32),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             _infoItem("Height", "0.4 m (1'04\")"),
          //             SizedBox(height: 8),
          //             _infoItem("Weight", "0.4 m (1'04\")"),
          //             SizedBox(height: 8),
          //             _infoItem("Abilities", "Static, Lightning Rod"),
          //             SizedBox(height: 8),
          //             _weaknessItem(),
          //             SizedBox(height: 8),
          //             _genderItem(),
          //           ],
          //         ),
          //       ),
          //       isExpanded: true,
          //     ),
          //   ],
          // ),

          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: items.length,
          //   itemBuilder: (context, index) {
          //     print(index);
          //     Item item = items[index];
          //     return ColoredBox(
          //       color: items[0].color,
          //       child: ClipRRect(
          //         borderRadius: const BorderRadius.only(
          //           topLeft: Radius.circular(10),
          //           topRight: Radius.circular(10),
          //         ),
          //         child: ExpansionPanelList(
          //           expandedHeaderPadding: const EdgeInsets.all(0),
          //           expansionCallback: (int _, bool isExpanded) {
          //             for (var element in items) {
          //               element.isExpanded = false;
          //             }
          //             item.isExpanded = isExpanded;
          //             setState(() {});
          //           },
          //           children: [
          //             ExpansionPanel(
          //               headerBuilder: (BuildContext context, bool isExpanded) {
          //                 return Container(
          //                   decoration: const BoxDecoration(
          //                     borderRadius: BorderRadius.only(
          //                       topLeft: Radius.circular(10),
          //                       topRight: Radius.circular(10),
          //                     ),
          //                   ),
          //                   child: Padding(
          //                     padding: const EdgeInsets.symmetric(
          //                       horizontal: 24,
          //                       vertical: 16,
          //                     ),
          //                     child: Text(item.headerValue),
          //                   ),
          //                 );
          //               },
          //               body: ListTile(title: Text(item.expandedValue)),
          //               isExpanded: item.isExpanded,
          //               backgroundColor:
          //                   item.isExpanded ? Colors.white : item.color,
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // )
        ],
      ),
    );
  }

  Widget _buildExpandableBox(
      {required String title, required bool isExpanded}) {
    return Stack(
      children: [
        AnimatedContainer(
          width: 300,
          height: isExpanded ? 200 : 50,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 8),
                blurRadius: 10,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  PokemonInfoPanel(widget.data),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.color,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
  Color color;
}

List<Item> generateItems(Color color, int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: ['Info', 'Stats & Breed', 'Evolution'][index],
      expandedValue: 'Contenido para el panel ${[
        'Info',
        'Stats & Breed',
        'Evolution'
      ][index]}',
      color: color.withOpacity(1 - (index * .2)),
      isExpanded: index == 0,
    );
  });
}
