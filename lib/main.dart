import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mewa/screens/categories.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 40, 85),
  cardColor: Color.fromARGB(255, 151, 157, 172),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.blue[900],
  ),
  textTheme: GoogleFonts.latoTextTheme().apply(
    displayColor: Colors.white,
    bodyColor: Colors.white
  ),
  
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}