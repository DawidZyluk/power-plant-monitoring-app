import 'package:MEWA/data/data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MEWA/screens/categories.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 40, 85),
  // scaffoldBackgroundColor: Color.fromARGB(255, 23, 46, 73),
  cardColor: Color.fromARGB(90, 151, 157, 172),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.blue[900],
  ),
  textTheme: GoogleFonts.latoTextTheme()
      .apply(displayColor: Colors.white, bodyColor: Colors.white),
);

Widget homePage = Scaffold(
  body: Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.signal_cellular_connected_no_internet_4_bar_outlined, size: 40, color: Colors.white,),
        const SizedBox(
          height: 16,
        ),
        Text("Brak połączenia z serwerem", style: TextStyle(fontSize: 20))
      ],
    ),
  ),
);

void main() async {
  await dotenv.load(fileName: ".env");
  await getAllData(); //.timeout(const Duration(seconds: 3));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: homePage,
    );
  }
}
