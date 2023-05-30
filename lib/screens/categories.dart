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
    if(category.id == "c1") screen = CombinedPhasesScreen(title: category.title, readings: combinedPhases);
    if(category.id == "c2") screen = ElectricAvgScreen(title: category.title, readings: electricAvg);
    if(category.id == "c3") screen = WaterReadingsScreen(title: category.title, readings: waterReadings);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategorie odczytów"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30,),
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
