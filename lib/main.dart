import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget get img =>
      SvgPicture.asset('assets/images/pokeball-transparent.svg', height: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(124),
        child: CustomAppBar(),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ColoredBox(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: constraint.maxHeight,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Pokedex',
                  style: GoogleFonts.robotoFlex().copyWith(
                    color: const Color.fromRGBO(18, 18, 18, 1),
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: -70,
              child: SvgPicture.asset(
                'assets/images/pokeball-transparent.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(244, 244, 244, 1),
                  BlendMode.srcIn,
                ),
                height: 200,
              ),
            ),
          ],
        ),
      );
    });
  }
}
