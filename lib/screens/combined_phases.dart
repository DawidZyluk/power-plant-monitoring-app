import 'package:flutter/material.dart';
import 'package:mewa/data/dummy_data.dart';
import 'package:mewa/models/combined_phases.dart';
import 'package:mewa/models/phase_readings.dart';
import 'package:mewa/widgets/combined_phases.dart';
import 'package:mewa/widgets/phase_reading.dart';

class CombinedPhasesScreen extends StatelessWidget {
  const CombinedPhasesScreen(
      {super.key, required this.title, required this.readings});

  final String title;
  final List<CombinedPhases> readings;

   void _selectCategory(BuildContext context, PhaseReadings readings) {
    
    Widget screen = PhaseReading(reading: readings);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => screen));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: readings.length,
        itemBuilder: (ctx, index) => CombinedPhasesWidget(
              reading: readings[index],
              onSelectCategory: (int phaseNumber) {
                print(readings[index].phase1Id);
                PhaseReadings phaseInfo = phase1[index];
                if(phaseNumber == 1) phaseInfo = phase1[readings[index].phase1Id-1];
                if(phaseNumber == 2) phaseInfo = phase2[readings[index].phase2Id-1];
                if(phaseNumber == 3) phaseInfo = phase3[readings[index].phase3Id-1];
                _selectCategory(context, phaseInfo);
              },
            ));

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
        body: content);
  }
}
