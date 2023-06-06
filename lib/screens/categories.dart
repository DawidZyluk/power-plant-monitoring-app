import 'package:flutter/material.dart';
import 'package:mewa/data/dummy_data.dart';
import 'package:mewa/models/category.dart';
import 'package:mewa/screens/combined_phases.dart';
import 'package:mewa/screens/electric_avg.dart';
import 'package:mewa/screens/water_readings.dart';
import 'package:mewa/widgets/category_grid_item.dart';
import 'package:mewa/screens/phase_readings.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    Widget screen = PhaseReadingsScreen(title: category.title, readings: []);
    if(category.id == "c1") screen = CombinedPhasesScreen(title: category.title, readings: cbphases);
    if(category.id == "c2") screen = ElectricAvgScreen(title: category.title, readings: electricAvg);
    if(category.id == "c3") screen = WaterReadingsScreen(title: category.title, readings: waterReadings);

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => screen));
  }

  @override
  Widget build(BuildContext context) {
    getCombinedPhases();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel główny"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            color: Color.fromARGB(100, 10, 10, 10),
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(100, 241, 241, 241),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: const [
                  Text("Status elektrowni", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text("Napięcie: tak", style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text("Odchylacz: tak", style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text("Moc czynnna: 10kW", style: TextStyle(fontSize: 16),),
                ],
              )
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
    );
  }
}
