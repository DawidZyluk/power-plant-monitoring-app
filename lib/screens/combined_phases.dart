import 'package:flutter/material.dart';
import 'package:mewa/data/data.dart';
import 'package:mewa/models/combined_phases.dart';
import 'package:mewa/models/phase_readings.dart';
import 'package:mewa/widgets/combined_phases.dart';
import 'package:mewa/widgets/phase_reading.dart';

class CombinedPhasesScreen extends StatelessWidget {
  const CombinedPhasesScreen(
      {super.key, required this.title, required this.readings});

  final String title;
  final List<CombinedPhases> readings;

  void _selectPhase(BuildContext context, PhaseReadings readings) {
    Widget screen = PhaseReading(reading: readings);

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
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

    if (readings.isNotEmpty) {
      content = ListView.builder(
        itemCount: readings.length,
        itemBuilder: (ctx, index) => CombinedPhasesWidget(
              reading: readings[index],
              onSelectPhase: (int phaseNumber) {
                PhaseReadings phaseInfo = phase1[index];
                if(phaseNumber == 1) phaseInfo = phase1[readings[index].phase1Id-1];
                if(phaseNumber == 2) phaseInfo = phase2[readings[index].phase2Id-1];
                if(phaseNumber == 3) phaseInfo = phase3[readings[index].phase3Id-1];
                _selectPhase(context, phaseInfo);
              },
            )
          );
     }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
