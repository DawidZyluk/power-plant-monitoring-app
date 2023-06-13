import 'package:flutter/material.dart';
import 'package:MEWA/models/phase_readings.dart';
import 'package:MEWA/widgets/phase_reading.dart';

class PhaseReadingsScreen extends StatelessWidget {
  const PhaseReadingsScreen({super.key, required this.title, required this.readings});

  final String title;
  final List<PhaseReadings> readings;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: readings.length,
        itemBuilder: (ctx, index) => PhaseReading(reading: readings[index]));

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
