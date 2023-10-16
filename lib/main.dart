import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/src/ui/components/components.dart';

import 'src/data/data.dart';
import 'src/providers/providers.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(pokemonGendersProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  Widget get img =>
      SvgPicture.asset('assets/images/pokeball-transparent.svg', height: 300);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PokemonNotifier provider = ref.watch(pokemonProvider.notifier);
    List<Pokemon> pokemons = ref.watch(pokemonProvider);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: PokedexHeader(),
      ),
      backgroundColor: Colors.white,
      body: pokemons.isEmpty && provider.isLoading
          ? const LoadingIndicator()
          : const PokedexPokemonList(),
    );
  }
}
