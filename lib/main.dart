import 'package:MEWA/data/data.dart';
import 'package:MEWA/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MEWA/screens/categories.dart';
import 'package:permission_handler/permission_handler.dart';

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
        Icon(
          Icons.signal_cellular_connected_no_internet_4_bar_outlined,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          height: 16,
        ),
        Text("Brak połączenia z serwerem", style: TextStyle(fontSize: 20))
      ],
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();

  var storage = await Permission.storage.status;
  var external = await Permission.manageExternalStorage.status;

  if (storage.isDenied) {
    await Permission.storage.request();
  }
  if (external.isDenied) {
    await Permission.manageExternalStorage.request();
  }

  await dotenv.load(fileName: ".env");
  try {
    await getAllData().timeout(const Duration(seconds: 6));
    homePage = const CategoriesScreen();
  } catch (error) {}
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
