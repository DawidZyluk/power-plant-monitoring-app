import 'dart:math';
import 'dart:async';
import 'package:MEWA/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:MEWA/models/category.dart';
import 'package:MEWA/screens/combined_phases.dart';
import 'package:MEWA/screens/electric_avg.dart';
import 'package:MEWA/screens/power_active_chart.dart';
import 'package:MEWA/screens/water_readings.dart';
import 'package:MEWA/widgets/category_grid_item.dart';
import 'package:MEWA/screens/phase_readings.dart';
import 'package:MEWA/widgets/powerplant_info.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String timestamp = "";
  bool voltage = false;
  bool diverter = false;
  double powerActiveAvg = 0;
  Timer? timer;

  void _selectCategory(BuildContext context, Category category) {
    Widget screen = PhaseReadingsScreen(title: category.title, readings: []);
    if (category.id == "c1")
      screen = CombinedPhasesScreen(title: category.title);
    if (category.id == "c2")
      screen = ElectricAvgScreen(title: category.title, readings: electricAvg);
    if (category.id == "c3")
      screen =
          WaterReadingsScreen(title: category.title, readings: waterReadings);
    if (category.id == "c4") screen = PowerActiveChart();

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }

  Future refresh() async {
    print("refresh");
    await getAllData().timeout(const Duration(seconds: 12));
    setState(() {
      timestamp = phase1[0].timestamp;
      voltage = phase1[0].voltage != 0 &&
              phase2[0].voltage != 0 &&
              phase3[0].voltage != 0
          ? true
          : false;
      diverter = waterReadings[0].diverterStatus;
      powerActiveAvg = (phase1[0].powerActive +
              phase2[0].powerActive +
              phase3[0].powerActive) /
          3;
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => refresh());

    setState(() {
      timestamp = phase1[0].timestamp;
      voltage = phase1[0].voltage != 0 &&
              phase2[0].voltage != 0 &&
              phase3[0].voltage != 0
          ? true
          : false;
      diverter = waterReadings[0].diverterStatus;
      powerActiveAvg = (phase1[0].powerActive +
              phase2[0].powerActive +
              phase3[0].powerActive) /
          3;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel główny"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          children: [
            PowerplantInfo(
              timestamp: timestamp,
              voltage: voltage,
              diverter: diverter,
              powerActiveAvg: powerActiveAvg,
            ),
            TextButton(
              onPressed: () async {
                NotificationService().showNotification(id: new Random().nextInt(1000000), title: 'Sample title', body: 'Some important information!');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Send notification",
                style: TextStyle(color: Colors.white),
              ),
            ),
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
      ),
    );
  }
}
