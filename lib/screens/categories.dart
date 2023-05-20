import 'package:flutter/material.dart';
import 'package:mewa/data/dummy_data.dart';
import 'package:mewa/models/category.dart';
import 'package:mewa/screens/electric_readings.dart';
import 'package:mewa/screens/water_readings.dart';
import 'package:mewa/widgets/category_grid_item.dart';
import 'package:mewa/screens/phase_readings.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    Widget screen = PhaseReadingsScreen(title: category.title, readings: []);
    if(category.id == "c1") screen = PhaseReadingsScreen(title: category.title, readings: phase1);
    if(category.id == "c2") screen = PhaseReadingsScreen(title: category.title, readings: phase2);
    if(category.id == "c3") screen = PhaseReadingsScreen(title: category.title, readings: phase3);
    if(category.id == "c4") screen = ElectricReadingsScreen(title: category.title, readings: electricReadings);
    if(category.id == "c5") screen = WaterReadingsScreen(title: category.title, readings: waterReadings);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategorie odczytów"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
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
