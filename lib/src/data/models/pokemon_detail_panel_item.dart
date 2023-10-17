part of com.devdennysegura.pokedex.data.models;

class Item {
  Item({
    required this.title,
    required this.icon,
    required this.color,
    required this.content,
    this.isExpanded = false,
  });

  String title;
  IconData icon;
  bool isExpanded;
  Widget content;
  Color color;
}
