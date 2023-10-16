part of com.devdennysegura.pokedex.data.models;

class PokemonInfo {
  final int height;
  final int weight;
  final List<String> abilities;

  PokemonInfo({
    required this.height,
    required this.weight,
    required this.abilities,
  });

  @override
  int get hashCode => height.hashCode ^ weight.hashCode ^ abilities.hashCode;

  @override
  bool operator ==(Object other) =>
      other is PokemonInfo &&
      other.height == height &&
      other.weight == weight &&
      other.abilities == abilities;

  String get formattedHeight {
    double heightInMeters = height / 10;
    double heightInFeet = heightInMeters * 3.28084;
    int feet = heightInFeet.floor();
    double remainingFeet = heightInFeet - feet;
    int inches = (remainingFeet * 12).round();
    return '$heightInMeters m ($feet\'$inches")';
  }

  String get formattedWeight {
    double weightInKg = weight / 10;
    double weightInLbs = weightInKg * 2.20462;
    return '$weightInKg kg (${weightInLbs.toStringAsFixed(1)} lbs)';
  }
}
