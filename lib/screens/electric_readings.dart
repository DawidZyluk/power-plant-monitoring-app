import 'package:flutter/material.dart';
import 'package:mewa/models/combined_phases.dart';
import 'package:mewa/widgets/electric_reading.dart';

class ElectricReadingsScreen extends StatelessWidget {
  const ElectricReadingsScreen({super.key, required this.title, required this.readings});

  final String title;
  final List<ElectricReadings> readings;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: readings.length,
        itemBuilder: (ctx, index) => ElectricReading(reading: readings[index]));

    if (readings.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Brak odczytów",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Coś poszło nie tak",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content
      );
  }
}
